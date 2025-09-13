import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData(ThemeMode mode) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.backgroundWhite(mode),
      primaryColor: AppColors.primaryColor(mode),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundWhite(mode),
        iconTheme: IconThemeData(color: AppColors.iconCustomColor(mode)),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary(mode),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardColor: AppColors.cardDefaultColor(mode),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppColors.textPrimary(mode)),
        bodySmall: TextStyle(color: AppColors.textUnselected(mode)),
      ),
      iconTheme: IconThemeData(color: AppColors.iconCustomColor(mode)),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundWhite(mode),
        hintStyle: TextStyle(color: AppColors.textUnselected(mode)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderLight(mode)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}