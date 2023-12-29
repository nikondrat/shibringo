import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Icon? icon;
  const ButtonWidget({super.key, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
            onPressed: onPressed ?? () => context.pop(),
            icon: icon ?? const Icon(UniconsLine.arrow_left)));
  }
}
