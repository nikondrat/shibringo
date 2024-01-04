import 'package:flutter/material.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: ButtonWidget()),
    );
  }
}
