import 'package:auto_resize_image/auto_resize_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'generated/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoResizeImage Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ImagePage(),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var url = "https://s2.loli.net/2024/02/27/yHRMwZr9lnjc7z4.jpg";
    debugInvertOversizedImages = true;
    return Scaffold(
      appBar: AppBar(title: const Text('AutoResizeImage Demo')),
      body: Wrap(
        children: [
          _buildImage(text: 'CachedNetworkImage', imageProvider: CachedNetworkImageProvider(url)),
          _buildImage(text: 'NetworkImage', imageProvider: NetworkImage(url)),
          _buildImage(text: 'AssetsImage contain', imageProvider: const AssetImage(Assets.assetsAa), resizeMode: ResizeMode.contain),
          _buildImage(text: 'AssetsImage balance', imageProvider: const AssetImage(Assets.assetsAa), resizeMode: ResizeMode.balance),
          _buildImage(text: 'AssetsImage cover', imageProvider: const AssetImage(Assets.assetsAa), resizeMode: ResizeMode.cover),
          _buildImage(text: 'Long image cover', imageProvider: const AssetImage(Assets.assetsLong)),
        ],
      ),
    );
  }

  Widget _buildImage({
    required String text,
    required ImageProvider imageProvider,
    ResizeMode resizeMode = ResizeMode.balance,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Image(
                fit: BoxFit.cover,
                image: AutoResizeImage(
                  resizeMode: resizeMode,
                  imageProvider: imageProvider,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                ),
              );
            },
          ),
        ),
        Text(text)
      ],
    );
  }
}
