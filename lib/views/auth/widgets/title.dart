import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 1,
            fontSize: 48));
  }
}
