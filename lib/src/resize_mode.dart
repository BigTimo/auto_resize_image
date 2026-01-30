import 'package:flutter/widgets.dart';

/// Decoding and caching modes, debugInvertOversizedImages tip see [paintImage]
///
/// 解码和缓存模式，图片过载提示请看[paintImage]
enum ResizeMode {
  /// The maximum width and height of the image are equal to the minimum width and height of the widget,
  /// resulting in lower clarity and avoiding being Oversized.
  ///
  /// 图片宽高的最大值等于widget宽高的最小值，清晰度低，不会Oversized
  ///
  /// ![](https://github.com/BigTimo/auto_resize_image/blob/master/img/contain.jpg?raw=true)
  contain,

  /// The area of the image is equal to the area of the widget, resulting in moderate clarity and avoiding being Oversized.
  ///
  /// 图片面积等于widget面积，清晰度中，不会Oversized
  ///
  /// ![](https://github.com/BigTimo/auto_resize_image/blob/master/img/balance.jpg?raw=true)
  balance,

  /// The minimum width and height of the image are equal to the maximum width and height of the widget,
  /// resulting in higher clarity but potentially causing Oversized issues.
  ///
  /// 图片宽高的最小值等于widget宽高的最大值，清晰度高，会Oversized
  ///
  /// ![](https://github.com/BigTimo/auto_resize_image/blob/master/img/cover.jpg?raw=true)
  cover,
}
