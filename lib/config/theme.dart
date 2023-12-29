import 'package:flutter/material.dart';
import 'package:shibringo/config/palette.dart';

import 'constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: getMaterialColor(AppColors.lightPrimaryColor),
          backgroundColor: getMaterialColor(AppColors.lightBackgroundColor)));

  static ThemeData get dark => ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: AppConstants.kDefaultBorderAllRadius)),
              padding:
                  MaterialStatePropertyAll(AppConstants.kDefaultAllPadding),
              foregroundColor:
                  MaterialStatePropertyAll(AppColors.darkBackgroundColor),
              backgroundColor:
                  MaterialStatePropertyAll(AppColors.darkPrimaryColor))),
      inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(
              borderRadius: AppConstants.kDefaultBorderAllRadius,
              borderSide: BorderSide.none),
          filled: true,
          isDense: true,
          fillColor: AppColors.darkSecondaryColor),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: AppConstants.kDefaultBorderAllRadius / 2)),
              backgroundColor:
                  const MaterialStatePropertyAll(AppColors.darkSecondaryColor),
              foregroundColor:
                  const MaterialStatePropertyAll(AppColors.darkPrimaryColor))),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: getMaterialColor(AppColors.darkPrimaryColor),
          backgroundColor: getMaterialColor(AppColors.darkBackgroundColor)));
}
