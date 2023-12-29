import 'package:flutter/material.dart';
import 'package:shibringo/app.dart';
import 'domain/di/di.dart';
import 'gen/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await DI.init();

  runApp(TranslationProvider(child: const MainApp()));
}
