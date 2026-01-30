## AutoResizeImage
[![pub package](https://img.shields.io/pub/v/auto_resize_image.svg)](https://pub.dartlang.org/packages/auto_resize_image)

文档语言: [English](https://github.com/BigTimo/auto_resize_image/blob/master/README.md) | 中文简体

根据widget的大小自动调整图片缓存大小



## 特征

支持各类 ImageProvider

包括`NetworkImage`,`AssetImage`,`FileImage`等

支持[CachedNetworkImageProvider](https://pub.dev/packages/cached_network_image)

| debugInvertOversizedImages = false                           | debugInvertOversizedImages = true                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/oversize_false.jpg?raw=true" style="zoom:25%;" /> | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/oversize_true.jpg?raw=true" style="zoom:25%;" /> |

## 使用

[![pub package](https://img.shields.io/pub/v/auto_resize_image.svg)](https://pub.dartlang.org/packages/auto_resize_image)

```dart
auto_resize_image:1.0.0
```



```dart
SizedBox(
  width: 200,
  height: 200,
  child: LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return Image(
        fit: BoxFit.cover,
        image: AutoResizeImage(
          imageProvider: CachedNetworkImageProvider(url),
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        ),
      );
    },
  ),
),
```



## 附加信息

绿色框为控件尺寸，红色框为图片缓存尺寸

| ResizeMode |                             图示                             | 清晰度/内存占用 | Oversized |
| :--------: | :----------------------------------------------------------: | :-------------: | :-------: |
|  contain   | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/contain.jpg?raw=true" style="zoom:50%;" /> |       低        |    否     |
|  balance   | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/balance.jpg?raw=true" alt="20240227_165706.jpg" style="zoom: 50%;" /> |       中        |    否     |
|   cover    | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/cover.jpg?raw=true" style="zoom: 50%;" /> |       高        |    是     |

