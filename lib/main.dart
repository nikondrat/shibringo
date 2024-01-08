import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shibringo/app.dart';
import 'package:shibringo/firebase_options.dart';
import 'package:user_repository/repository/repository.dart';
import 'domain/di/di.dart';
import 'gen/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load(fileName: ".env", mergeWith: Platform.environment);

  await DI.init();

  DI.i
      .get<UserRepository>()
      .init({'OPTIONS': DefaultFirebaseOptions.currentPlatform});

  runApp(TranslationProvider(child: const MainApp()));
}
