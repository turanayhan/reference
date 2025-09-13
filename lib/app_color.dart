import 'package:flutter/material.dart';

class AppColors {
  // --------------------------
  // Ana Renkler
  // --------------------------
  static Color primaryBlue(ThemeMode mode) => const Color(0xFF3478F6);
  static Color primaryColor(ThemeMode mode) => primaryBlue(mode);

  static Color textBlack(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF1A1A1A) : Colors.white;

  static Color textPrimary(ThemeMode mode) => textBlack(mode);

  static Color textUnselected(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF757575) : Colors.grey[400]!;

  static Color textSelected(ThemeMode mode) => textBlack(mode);

  static Color backgroundWhite(ThemeMode mode) =>
      mode == ThemeMode.light ? Colors.white : Colors.black;

  static Color backgroundDark(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFF8F9FA) : Colors.grey[900]!;

  // --------------------------
  // Input Alanları
  // --------------------------
  static Color inputBackground(ThemeMode mode) =>
      mode == ThemeMode.light ? Colors.white : Colors.grey[850]!;

  static Color inputText(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF1A1A1A) : Colors.white;

  static Color inputHint(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF8E8E93) : Colors.grey[400]!;

  static Color inputBorderGrey(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFE0E0E0) : Colors.grey[700]!;

  // --------------------------
  // Gölge
  // --------------------------
  static Color shadowColor(ThemeMode mode) =>
      mode == ThemeMode.light ? Colors.black12 : Colors.black38;

  // --------------------------
  // Hata
  // --------------------------
  static Color errorRed(ThemeMode mode) => const Color(0xFFD32F2F);
  static Color errorText(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFB00020) : const Color(0xFFFFCDD2);

  // --------------------------
  // Sidebar / Bottom Nav
  // --------------------------
  static Color sidebarBackground(ThemeMode mode) =>
      mode == ThemeMode.light ? Colors.white : Colors.black;

  static Color selectedItemBackground(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFE3F2FD) : Colors.grey[800]!;

  static Color iconCustomColor(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF05081A) : Colors.white;

  static Color iconSelected(ThemeMode mode) => iconCustomColor(mode);

  static Color iconUnselected(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[500]!;

  // --------------------------
  // Ekstra Tanımlar
  // --------------------------
  static Color hintColor(ThemeMode mode) => inputHint(mode);

  static Color copyrightGrey(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[500]!;

  static Color darkGrayColor(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF616161) : Colors.grey[400]!;

  static Color lightGrayColor(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFF5F5F5) : Colors.grey[800]!;

  static Color blackColor(ThemeMode mode) =>
      mode == ThemeMode.light ? Colors.black : Colors.white;

  static Color whiteColor(ThemeMode mode) => Colors.white;

  static Color grey(ThemeMode mode) =>
      mode == ThemeMode.light ? Colors.grey : Colors.grey[400]!;

  static Color darkGrey(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF4F4F4F) : Colors.grey[500]!;

  static Color borderLight(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFD6D6D6) : Colors.grey[700]!;

  // --------------------------
  // Durum renkleri
  // --------------------------
  static Color statusApproved(ThemeMode mode) => const Color(0xFF2E7D32);
  static Color statusApprovedBg(ThemeMode mode) => const Color(0xFFC8E6C9);
  static Color statusRejected(ThemeMode mode) => const Color(0xFFD32F2F);
  static Color statusRejectedBg(ThemeMode mode) => const Color(0xFFFFCDD2);
  static Color statusPending(ThemeMode mode) => Colors.orange;
  static Color statusPendingBg(ThemeMode mode) => const Color(0xFFFFECB3);

  static Color backgroundHomeList(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFF8FAFC) : Colors.grey[900]!;

  static Color navbarIconColor(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[400]!;

  static Color navbarIconSelectedColor(ThemeMode mode) => iconSelected(mode);

  static Color navbarSelecetTextColor(ThemeMode mode) => whiteColor(mode);

  static Color navbarUnSelectTextColor(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF9E9E9E) : Colors.grey[400]!;

  // --------------------------
  // Ekstra icon/renkler
  // --------------------------
  static Color yellowCircle(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFFFF4D9) : Colors.grey[700]!;

  static Color greenCircle(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFD1FAE5) : Colors.grey[800]!;

  static Color deepOrange(ThemeMode mode) => const Color(0xFFEA9C06);

  static Color softPurple(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFF3E8FF) : Colors.grey[800]!;

  static Color lightYellow(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFFEF3C7) : Colors.grey[800]!;

  static Color lightPink(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFFEE2E2) : Colors.grey[800]!;

  static Color darkRed(ThemeMode mode) => const Color(0xFFDC2626);

  static Color deepPurple(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFF9646EB) : const Color(0xFFB388FF);

  static Color cardDefaultColor(ThemeMode mode) =>
      mode == ThemeMode.light ? const Color(0xFFF8FAFC) : Colors.grey[850]!;
}