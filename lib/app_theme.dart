import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData(ThemeMode mode) {
    AppColors.setThemeMode(mode);

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      primaryColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundWhite,
        iconTheme: IconThemeData(color: AppColors.iconCustomColor),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardColor: AppColors.cardDefaultColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppColors.textPrimary),
        bodySmall: TextStyle(color: AppColors.textUnselected),
      ),
      iconTheme: IconThemeData(color: AppColors.iconCustomColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundWhite,
        hintStyle: TextStyle(color: AppColors.textUnselected),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}