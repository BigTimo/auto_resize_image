## AutoResizeImage

文档语言: [English](https://github.com/BigTimo/auto_resize_image/blob/master/README.md) | 中文简体

根据`widget`的大小，自动调整图片的缓存的`ResizeImage`



## 特征

支持各类 ImageProvider

包括`NetworkImage`,`AssetImage`,`FileImage`等

支持[CachedNetworkImageProvider](https://pub.dev/packages/cached_network_image)

| debugInvertOversizedImages = false                           | debugInvertOversizedImages = true                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://s2.loli.net/2024/02/28/aKPEl37huXGHSez.jpg" alt="Screenshot_20240227-183452.jpg" style="zoom:25%;" /> | <img src="https://s2.loli.net/2024/02/28/UGHqMsncfS4FAJO.jpg" alt="Screenshot_20240228-095622.jpg" style="zoom:25%;" /> |

## 使用



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
|  contain   | <img src="https://s2.loli.net/2024/02/28/27lijdrHDCFOkY1.jpg" alt="20240227_165632.jpg" style="zoom:25%;" /> |       低        |    否     |
|  balance   | <img src="https://s2.loli.net/2024/02/28/ySYTuAZ1vXoFHib.jpg" alt="20240227_165706.jpg" style="zoom:25%;" /> |       中        |    否     |
|   cover    | <img src="https://s2.loli.net/2024/02/28/5mV6fMKj8GigFzv.jpg" alt="20240227_165733.jpg" style="zoom:20%;" /> |       高        |    是     |

