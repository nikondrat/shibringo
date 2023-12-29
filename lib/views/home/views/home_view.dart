import 'package:flutter/material.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.common.app_name),
      ),
    );
  }
}
