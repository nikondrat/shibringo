import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;
  const DescriptionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        style: const TextStyle(color: Colors.white70, fontSize: 16));
  }
}
