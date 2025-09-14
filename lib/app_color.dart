import 'package:flutter/material.dart';

class AppColors {
  static late ThemeMode _themeMode;

  /// Sayfa başında veya build içinde sadece 1 kere çağırılacak
  static void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
  }

  // --------------------------
  // Ana Renkler
  // --------------------------
  static Color get primaryBlue => const Color(0xFF3478F6);
  static Color get primaryColor => primaryBlue;

  static Color get textBlack =>
      _themeMode == ThemeMode.light ? const Color(0xFF1A1A1A) : Colors.white;

  static Color get textPrimary => textBlack;

  static Color get textUnselected =>
      _themeMode == ThemeMode.light ? const Color(0xFF757575) : Colors.grey[400]!;

  static Color get textSelected => textBlack;

  static Color get backgroundWhite =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.black;

  static Color get backgroundDark =>
      _themeMode == ThemeMode.light ? const Color(0xFFF8F9FA) : Colors.grey[900]!;

  // --------------------------
  // Input Alanları
  // --------------------------
  static Color get inputBackground =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.grey[850]!;

  static Color get inputText =>
      _themeMode == ThemeMode.light ? const Color(0xFF1A1A1A) : Colors.white;

  static Color get inputHint =>
      _themeMode == ThemeMode.light ? const Color(0xFF8E8E93) : Colors.grey[400]!;

  static Color get inputBorderGrey =>
      _themeMode == ThemeMode.light ? const Color(0xFFE0E0E0) : Colors.grey[700]!;

  // --------------------------
  // Gölge
  // --------------------------
  static Color get shadowColor =>
      _themeMode == ThemeMode.light ? Colors.black12 : Colors.black38;

  // --------------------------
  // Hata
  // --------------------------
  static Color get errorRed => const Color(0xFFD32F2F);
  static Color get errorText =>
      _themeMode == ThemeMode.light ? const Color(0xFFB00020) : const Color(0xFFFFCDD2);

  // --------------------------
  // Sidebar / Bottom Nav
  // --------------------------
  static Color get sidebarBackground =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.black;

  static Color get selectedItemBackground =>
      _themeMode == ThemeMode.light ? const Color(0xFFE3F2FD) : Colors.grey[800]!;

  static Color get iconCustomColor =>
      _themeMode == ThemeMode.light ? const Color(0xFF05081A) : Colors.white;

  static Color get iconSelected => iconCustomColor;

  static Color get iconUnselected =>
      _themeMode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[500]!;

  // --------------------------
  // Ekstra Tanımlar
  // --------------------------
  static Color get hintColor => inputHint;

  static Color get copyrightGrey =>
      _themeMode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[500]!;

  static Color get darkGrayColor =>
      _themeMode == ThemeMode.light ? const Color(0xFF616161) : Colors.grey[400]!;

  static Color get lightGrayColor =>
      _themeMode == ThemeMode.light ? const Color(0xFFF5F5F5) : Colors.grey[800]!;

  static Color get blackColor =>
      _themeMode == ThemeMode.light ? Colors.black : Colors.white;

  static Color get whiteColor => Colors.white;

  static Color get grey =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey[400]!;

  static Color get darkGrey =>
      _themeMode == ThemeMode.light ? const Color(0xFF4F4F4F) : Colors.grey[500]!;

  static Color get borderLight =>
      _themeMode == ThemeMode.light ? const Color(0xFFD6D6D6) : Colors.grey[700]!;

  // --------------------------
  // Durum renkleri
  // --------------------------
  static Color get statusApproved => const Color(0xFF2E7D32);
  static Color get statusApprovedBg => const Color(0xFFC8E6C9);
  static Color get statusRejected => const Color(0xFFD32F2F);
  static Color get statusRejectedBg => const Color(0xFFFFCDD2);
  static Color get statusPending => Colors.orange;
  static Color get statusPendingBg => const Color(0xFFFFECB3);

  static Color get backgroundHomeList =>
      _themeMode == ThemeMode.light ? const Color(0xFFF8FAFC) : Colors.grey[900]!;

  static Color get navbarIconColor =>
      _themeMode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[400]!;

  static Color get navbarIconSelectedColor => iconSelected;

  static Color get navbarSelecetTextColor => whiteColor;

  static Color get navbarUnSelectTextColor =>
      _themeMode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[400]!;

  // --------------------------
  // Ekstra icon/renkler
  // --------------------------
  static Color get yellowCircle =>
      _themeMode == ThemeMode.light ? const Color(0xFFFFF4D9) : Colors.grey[700]!;

  static Color get greenCircle =>
      _themeMode == ThemeMode.light ? const Color(0xFFD1FAE5) : Colors.grey[800]!;

  static Color get deepOrange => const Color(0xFFEA9C06);

  static Color get softPurple =>
      _themeMode == ThemeMode.light ? const Color(0xFFF3E8FF) : Colors.grey[800]!;

  static Color get lightYellow =>
      _themeMode == ThemeMode.light ? const Color(0xFFFEF3C7) : Colors.grey[800]!;

  static Color get lightPink =>
      _themeMode == ThemeMode.light ? const Color(0xFFFEE2E2) : Colors.grey[800]!;

  static Color get darkRed => const Color(0xFFDC2626);

  static Color get deepPurple =>
      _themeMode == ThemeMode.light ? const Color(0xFF9646EB) : const Color(0xFFB388FF);

  static Color get cardDefaultColor =>
      _themeMode == ThemeMode.light ? const Color(0xFFF8FAFC) : Colors.grey[850]!;
}