import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // Ana Renkler
  static const Color primaryBlue = Color(0xFF3478F6); // iOS tarzı mavi
  static const Color primaryColor = primaryBlue;

  static const Color textBlack = Color(0xFF1A1A1A);
  static const Color textPrimary = Color(0xFF1A1A1A); // Metin için koyu ton
  static const Color textUnselected = Color(0xFF757575); // Gri ton
  static const Color textSelected = textBlack;

  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFFF8F9FA); // Hafif gri-beyaz

  // Input alanları
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputText = Color(0xFF1A1A1A);
  static const Color inputHint = Color(0xFF8E8E93);
  static const Color inputBorderGrey = Color(0xFF010617);

  // Gölge
  static const Color shadowColor = Colors.black12;

  // Hata
  static const Color errorRed = Color(0xFFD32F2F);
  static const Color errorText = Color(0xFFB00020);

  // Sidebar / Bottom Nav
  static const Color sidebarBackground = Color(0xFFFFFFFF); // Tam beyaz
  static const Color selectedItemBackground = Color(
    0xFF010617,
  ); // Açık mavi arka plan

  // **Yeni icon rengi**
  static const Color iconCustomColor = Color(0xFFFFFFFF); // İstediğin renk

  static const Color iconSelected =
      iconCustomColor; // iconSelected rengi güncellendi
  static const Color iconUnselected = Color(0xFF9E9E9E);

  // Ekstra Tanımlar
  static const Color hintColor = inputHint;
  static const Color copyrightGrey = Color(0xFF9E9E9E);
  static const Color darkGrayColor = Color(0xFF616161);
  static const Color lightGrayColor = Color(0xFFF5F5F5);

  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Colors.white;
  static const Color grey = Colors.grey;
  static const Color darkGrey = Color(0xFF4F4F4F);
  static const Color black = Colors.black;

  // iconPrimary rengini değiştirdik
  static const Color iconPrimary = iconCustomColor;
  static const Color iconLight = Colors.white;
  static const Color progressIndicatorLight = primaryBlue;

  static const Color borderLight = Color(0xFFD6D6D6); // <-- buraya ekledik
  static const Color statusApproved = Color(0xFF2E7D32); // dark green
  static const Color statusApprovedBg = Color(0xFFC8E6C9); // light green

  static const Color statusRejected = errorRed;
  static const Color statusRejectedBg = Color(0xFFFFCDD2); // light red

  static const Color statusPending = Colors.orange;
  static const Color statusPendingBg = Color(0xFFFFECB3);

  static const Color backgroundHomeList = Color(0xFFF8FAFC);
}