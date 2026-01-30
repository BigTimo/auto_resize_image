## AutoResizeImage

[![pub package](https://img.shields.io/pub/v/auto_resize_image.svg)](https://pub.dartlang.org/packages/auto_resize_image)

Language: English| [中文简体](https://github.com/BigTimo/auto_resize_image/blob/master/README_ZH.md)

Automatically adjust the image cache size based on the size of the widget.



## Features

Supports various types of ImageProviders including `NetworkImage`, `AssetImage`, `FileImage`, etc.

Supports [CachedNetworkImageProvider](https://pub.dev/packages/cached_network_image)

| debugInvertOversizedImages = false                           | debugInvertOversizedImages = true                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/oversize_false.jpg?raw=true" style="zoom:25%;" /> | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/oversize_true.jpg?raw=true" style="zoom:25%;" /> |

## Usage

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



## Additional information

The green box represents the size of the widget, while the red box represents the size of the image cache.

| ResizeMode |                         Illustration                         | Clarity/Memory Usage | Oversized |
| :--------: | :----------------------------------------------------------: | :------------------: | :-------: |
|  contain   | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/contain.jpg?raw=true" style="zoom:50%;" /> |         Low          |    No     |
|  balance   | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/balance.jpg?raw=true" alt="20240227_165706.jpg" style="zoom: 50%;" /> |        Medium        |    No     |
|   cover    | <img src="https://github.com/BigTimo/auto_resize_image/blob/master/img/cover.jpg?raw=true" style="zoom: 50%;" /> |         High         |    Yes    |
