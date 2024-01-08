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
      textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white)),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkSecondaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: AppConstants.kDefaultBorderAllRadius),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: AppConstants.kDefaultBorderAllRadius)),
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  vertical: AppConstants.kDefaultPadding * 1.2)),
              foregroundColor:
                  MaterialStatePropertyAll(AppColors.darkBackgroundColor),
              backgroundColor:
                  MaterialStatePropertyAll(AppColors.darkPrimaryColor))),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white70),
          suffixIconColor: AppColors.darkPrimaryColor,
          disabledBorder: OutlineInputBorder(
              borderRadius: AppConstants.kDefaultBorderAllRadius,
              borderSide: BorderSide(color: Colors.white70)),
          border: OutlineInputBorder(
              borderRadius: AppConstants.kDefaultBorderAllRadius,
              borderSide: BorderSide(color: Colors.white70)),
          focusedBorder: OutlineInputBorder(
              borderRadius: AppConstants.kDefaultBorderAllRadius,
              borderSide: BorderSide(color: Colors.white)),
          floatingLabelBehavior: FloatingLabelBehavior.always),
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
          accentColor: getMaterialColor(AppColors.darkSecondaryColor),
          backgroundColor: getMaterialColor(AppColors.darkBackgroundColor)));
}
