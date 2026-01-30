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

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    var url = "https://raw.githubusercontent.com/BigTimo/auto_resize_image/refs/heads/master/example/assets/aa.jpeg";
    return Scaffold(
      appBar: AppBar(title: const Text('AutoResizeImage Demo')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("debugInvertOversizedImages: $debugInvertOversizedImages"),
              Switch(
                  value: debugInvertOversizedImages,
                  onChanged: (value) {
                    setState(() {
                      debugInvertOversizedImages = value;
                    });
                  })
            ],
          ),
          Wrap(
            children: [
              _buildImage(text: 'CachedNetworkImage', imageProvider: CachedNetworkImageProvider(url)),
              _buildImage(text: 'NetworkImage', imageProvider: NetworkImage(url)),
              _buildImage(text: 'AssetsImage contain', imageProvider: const AssetImage(Assets.assetsAa), resizeMode: ResizeMode.contain),
              _buildImage(text: 'AssetsImage balance', imageProvider: const AssetImage(Assets.assetsAa), resizeMode: ResizeMode.balance),
              _buildImage(text: 'AssetsImage cover', imageProvider: const AssetImage(Assets.assetsAa), resizeMode: ResizeMode.cover),
              _buildImage(text: 'Long image cover', imageProvider: const AssetImage(Assets.assetsLong)),
            ],
          ),
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
