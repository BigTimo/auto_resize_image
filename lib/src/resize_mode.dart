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
  /// ![](https://s2.loli.net/2024/02/29/Bxd35DU7srAGCYE.jpg)
  contain,

  /// The area of the image is equal to the area of the widget, resulting in moderate clarity and avoiding being Oversized.
  ///
  /// 图片面积等于widget面积，清晰度中，不会Oversized
  ///
  /// ![](https://s2.loli.net/2024/02/29/qgHuBwLUPoIka9Y.jpg)
  balance,

  /// The minimum width and height of the image are equal to the maximum width and height of the widget,
  /// resulting in higher clarity but potentially causing Oversized issues.
  ///
  /// 图片宽高的最小值等于widget宽高的最大值，清晰度高，会Oversized
  ///
  /// ![](https://s2.loli.net/2024/02/29/73u2KOWmzPtI5jR.jpg)
  cover,
}
