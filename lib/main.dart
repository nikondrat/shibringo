import 'package:flutter/material.dart';
import 'package:shibringo/app.dart';
import 'package:user_repository/repository/repository.dart';
import 'domain/di/di.dart';
import 'gen/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await DI.init();

  const url = 'https://bvqolmivoxotvwkrvmro.supabase.co';
  // String.fromEnvironment('API_URL');
  const apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ2cW9sbWl2b3hvdHZ3a3J2bXJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQyMDAzNzQsImV4cCI6MjAxOTc3NjM3NH0.HW6GWMzZaTDICctf-jBMHwkhGVHo9R4I1gasJSiCMN0';
  // String.fromEnvironment('API_KEY');

  DI.i.get<UserRepository>().init(url, apiKey);

  runApp(TranslationProvider(child: const MainApp()));
}
