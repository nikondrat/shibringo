import 'package:flutter/material.dart';
import 'package:shibringo/app.dart';
import 'package:user_repository/repository/repository.dart';
import 'domain/di/di.dart';
import 'gen/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await DI.init();

  const url = String.fromEnvironment('API_URL');
  const apiKey = String.fromEnvironment('API_KEY');

  DI.i.get<UserRepository>().init(url, apiKey);

  runApp(TranslationProvider(child: const MainApp()));
}
