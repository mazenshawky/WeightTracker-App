import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.kPrimaryColor,
      centerTitle: true,
      // titleTextStyle:
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.kPrimaryColor,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, 48),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.kPrimaryLightColor,
      iconColor: AppColors.kPrimaryColor,
      prefixIconColor: AppColors.kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
