## AutoResizeImage

Language: English| [中文简体](https://github.com/BigTimo/auto_resize_image/blob/master/README_ZH.md)

Automatically resize the cached `ResizeImage` based on the size of the `widget`.



## Features

Supports various types of ImageProviders including `NetworkImage`, `AssetImage`, `FileImage`, etc.

Supports [CachedNetworkImageProvider](https://pub.dev/packages/cached_network_image)

| debugInvertOversizedImages = false                           | debugInvertOversizedImages = true                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://s2.loli.net/2024/02/28/aKPEl37huXGHSez.jpg" alt="Screenshot_20240227-183452.jpg" style="zoom:25%;" /> | <img src="https://s2.loli.net/2024/02/28/UGHqMsncfS4FAJO.jpg" alt="Screenshot_20240228-095622.jpg" style="zoom:25%;" /> |

## Usage



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
|  contain   | <img src="https://s2.loli.net/2024/02/28/27lijdrHDCFOkY1.jpg" alt="20240227_165632.jpg" style="zoom:25%;" /> |         Low          |    No     |
|  balance   | <img src="https://s2.loli.net/2024/02/28/ySYTuAZ1vXoFHib.jpg" alt="20240227_165706.jpg" style="zoom:25%;" /> |        Medium        |    No     |
|   cover    | <img src="https://s2.loli.net/2024/02/28/5mV6fMKj8GigFzv.jpg" alt="20240227_165733.jpg" style="zoom:20%;" /> |         High         |    Yes    |
