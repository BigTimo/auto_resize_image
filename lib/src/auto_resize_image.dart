import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'resize_mode.dart';

class AutoResizeImage extends ImageProvider<AutoResizeImageKey> {
  /// Creates an ImageProvider that decodes the image to the specified size.
  ///
  /// The cached image will be directly decoded and stored at the resolution
  /// defined by `width` and `height`. The image will lose detail and
  /// use less memory if resized to a size smaller than the native size.
  const AutoResizeImage({
    required this.imageProvider,
    required this.width,
    required this.height,
    this.resizeMode = ResizeMode.balance,
    this.overRatio = 2,
  });

  /// The [ImageProvider] that this class wraps.
  final ImageProvider imageProvider;

  /// The width of the widget controls image decode and cache.
  /// 控件的宽度，控制图片解码和缓存
  final double width;

  /// The height of the widget controls image decode and cache.
  /// 控件的高度，控制图片解码和缓存
  final double height;

  /// 解码和缓存模式
  final ResizeMode resizeMode;

  /// 长/宽图比例
  final double overRatio;

  @override
  Future<AutoResizeImageKey> obtainKey(ImageConfiguration configuration) {
    Completer<AutoResizeImageKey>? completer;
    // If the imageProvider.obtainKey future is synchronous, then we will be able to fill in result with
    // a value before completer is initialized below.
    SynchronousFuture<AutoResizeImageKey>? result;
    imageProvider.obtainKey(configuration).then((Object key) {
      if (completer == null) {
        // This future has completed synchronously (completer was never assigned),
        // so we can directly create the synchronous result to return.
        result = SynchronousFuture<AutoResizeImageKey>(AutoResizeImageKey._(key, width, height, resizeMode, overRatio));
      } else {
        // This future did not synchronously complete.
        completer.complete(AutoResizeImageKey._(key, width, height, resizeMode, overRatio));
      }
    });
    if (result != null) {
      return result!;
    }
    // If the code reaches here, it means the imageProvider.obtainKey was not
    // completed sync, so we initialize the completer for completion later.
    completer = Completer<AutoResizeImageKey>();
    return completer.future;
  }

  @override
  ImageStreamCompleter loadBuffer(AutoResizeImageKey key, DecoderBufferCallback decode) {
    Future<Codec> decodeResize(ImmutableBuffer buffer, {int? cacheWidth, int? cacheHeight, bool? allowUpscaling}) async {
      assert(
        cacheWidth == null && cacheHeight == null && allowUpscaling == null,
        'ResizeImage cannot be composed with another ImageProvider that applies '
        'cacheWidth, cacheHeight, or allowUpscaling.',
      );
      final ImageDescriptor descriptor = await ImageDescriptor.encoded(buffer);
      Size resize = _resize(descriptor);
      return descriptor.instantiateCodec(
        targetWidth: resize.width.round(),
        targetHeight: resize.height.round(),
      );
    }

    final ImageStreamCompleter completer = imageProvider.loadBuffer(key._providerCacheKey, decodeResize);
    if (!kReleaseMode) {
      completer.debugLabel = '${completer.debugLabel} - Resized(${key._width}×${key._height})';
    }
    return completer;
  }

  Size _resize(ImageDescriptor descriptor) {
    var displayWidth = width * PaintingBinding.instance.window.devicePixelRatio;
    var displayHeight = height * PaintingBinding.instance.window.devicePixelRatio;

    int imageWidth = descriptor.width;
    int imageHeight = descriptor.height;
    double aspectRatio = imageWidth / imageHeight;

    double targetWidth;
    double targetHeight;

    var mode = aspectRatio > overRatio || aspectRatio < 1 / overRatio ? ResizeMode.cover : resizeMode;
    switch (mode) {
      case ResizeMode.contain:
        if (aspectRatio > 1) {
          //wide
          targetWidth = displayWidth;
          targetHeight = displayWidth / aspectRatio;
        } else {
          //long
          targetWidth = displayHeight * aspectRatio;
          targetHeight = displayHeight;
        }
        break;
      case ResizeMode.cover:
        if (aspectRatio > 1) {
          //wide
          targetWidth = displayHeight * aspectRatio;
          targetHeight = displayHeight;
        } else {
          //long
          targetWidth = displayWidth;
          targetHeight = displayWidth / aspectRatio;
        }
        break;
      case ResizeMode.balance:
        double scale = sqrt((displayWidth * displayHeight) / (imageWidth * imageHeight));
        targetWidth = imageWidth * scale;
        targetHeight = imageHeight * scale;
        break;
    }
    return Size(targetWidth, targetHeight);
  }
}

/// This is used to identify the precise resource in the [imageCache].
@immutable
class AutoResizeImageKey {
  // Private constructor so nobody from the outside can poison the image cache
  // with this key. It's only accessible to [ResizeImage] internally.
  const AutoResizeImageKey._(this._providerCacheKey, this._width, this._height, this._resizeMode, this._overRatio);

  final Object _providerCacheKey;
  final double _width;
  final double _height;
  final ResizeMode _resizeMode;
  final double _overRatio;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AutoResizeImageKey &&
        other._providerCacheKey == _providerCacheKey &&
        other._width == _width &&
        other._height == _height &&
        other._resizeMode == _resizeMode &&
        other._overRatio == _overRatio;
  }

  @override
  int get hashCode => Object.hash(_providerCacheKey, _width, _height, _resizeMode, _overRatio);
}
