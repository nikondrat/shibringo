import 'package:flutter/material.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const ButtonWidget()),
    );
  }
}
