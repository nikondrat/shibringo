import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  const ImageWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: ExtendedImage.network(url,
            fit: BoxFit.cover,
            color: Colors.black.withAlpha(80),
            colorBlendMode: BlendMode.colorBurn));
  }
}
