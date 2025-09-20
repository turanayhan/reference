import 'package:flutter/material.dart';

class AppColors {
  static late ThemeMode _themeMode;

  static void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
  }

  static Color get primaryBlue => const Color(0xFF3478F6);
  static Color get primaryColor => primaryBlue;

  static Color get textBlack =>
      _themeMode == ThemeMode.light ? const Color(0xFF1A1A1A) : Colors.white;

  static Color get textPrimary => textBlack;
  static Color get textUnselected => _themeMode == ThemeMode.light
      ? const Color(0xFF757575)
      : Colors.grey[400]!;
  static Color get textSelected => textBlack;

  static Color get backgroundWhite =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.black;
  static Color get backgroundDark => _themeMode == ThemeMode.light
      ? const Color(0xFFF8F9FA)
      : Colors.grey[900]!;

  // --------------------------
  // Input Alanları
  // --------------------------
  static Color get inputBackground =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.grey[850]!;
  static Color get inputText =>
      _themeMode == ThemeMode.light ? const Color(0xFF1A1A1A) : Colors.white;
  static Color get inputHint => _themeMode == ThemeMode.light
      ? const Color(0xFF8E8E93)
      : Colors.grey[400]!;
  static Color get inputBorderGrey => _themeMode == ThemeMode.light
      ? const Color(0xFFE0E0E0)
      : Colors.grey[700]!;

  // --------------------------
  // Gölge
  // --------------------------
  static Color get shadowColor =>
      _themeMode == ThemeMode.light ? Colors.black12 : Colors.black38;

  // --------------------------
  // Hata
  // --------------------------
  static Color get errorRed => const Color(0xFFD32F2F);
  static Color get errorText => _themeMode == ThemeMode.light
      ? const Color(0xFFB00020)
      : const Color(0xFFFFCDD2);

  // --------------------------
  // Sidebar / Bottom Nav
  // --------------------------
  static Color get sidebarBackground =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.black;
  static Color get selectedItemBackground => _themeMode == ThemeMode.light
      ? const Color(0xFFE3F2FD)
      : Colors.grey[800]!;

  static Color get iconCustomColor =>
      _themeMode == ThemeMode.light ? const Color(0xFF05081A) : Colors.white;
  static Color get cursorColor =>
      _themeMode == ThemeMode.light ? const Color(0xFF05081A) : Colors.white;
  static Color get iconSelected => iconCustomColor;
  static Color get iconUnselected => _themeMode == ThemeMode.light
      ? const Color(0xFF9E9E9E)
      : Colors.grey[500]!;

  // --------------------------
  // Ekstra Tanımlar
  // --------------------------
  static Color get hintColor => inputHint;
  static Color get copyrightGrey => _themeMode == ThemeMode.light
      ? const Color(0xFF9E9E9E)
      : Colors.grey[500]!;
  static Color get darkGrayColor => _themeMode == ThemeMode.light
      ? const Color(0xFF616161)
      : Colors.grey[400]!;
  static Color get lightGrayColor => _themeMode == ThemeMode.light
      ? const Color(0xFFF5F5F5)
      : Colors.grey[800]!;
  static Color get blackColor =>
      _themeMode == ThemeMode.light ? Colors.black : Colors.white;

  static Color get whiteColor => Colors.white;
  static Color get grey =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey[400]!;
  static Color get darkGrey => _themeMode == ThemeMode.light
      ? const Color(0xFF4F4F4F)
      : Colors.grey[500]!;

  static Color get black => Colors.black;
  static Color get iconPrimary =>
      _themeMode == ThemeMode.light ? iconCustomColor : Colors.white;
  static Color get iconLight =>
      _themeMode == ThemeMode.light ? Colors.black54 : Colors.white70;
  static Color get progressIndicatorLight =>
      _themeMode == ThemeMode.light ? primaryBlue : Colors.blueAccent;

  static Color get borderLight => _themeMode == ThemeMode.light
      ? const Color(0xFFD6D6D6)
      : Colors.grey[700]!;

  // --------------------------
  // Durum renkleri
  // --------------------------
  static Color get statusApproved => const Color(0xFF2E7D32);
  static Color get statusApprovedBg => const Color(0xFFC8E6C9);
  static Color get statusRejected => const Color(0xFFD32F2F);
  static Color get statusRejectedBg => const Color(0xFFFFCDD2);
  static Color get statusPending => Colors.orange;
  static Color get statusPendingBg => const Color(0xFFFFECB3);

  static Color get statusPendingColor => _themeMode == ThemeMode.light
      ? const Color(0xFFE0F2FE)
      : Colors.grey[800]!;
  static Color get statusPendingTextColor => _themeMode == ThemeMode.light
      ? const Color(0xFF1A4F9C)
      : Colors.blue[200]!;

  static Color get backgroundHomeList => _themeMode == ThemeMode.light
      ? const Color(0xFFF8FAFC)
      : Colors.grey[900]!;

  static Color get navbarIconColor => _themeMode == ThemeMode.light
      ? const Color(0xFF9E9E9E)
      : Colors.grey[400]!;
  static Color get navbarIconSelectedColor => iconSelected;
  static Color get navbarSelecetTextColor => whiteColor;
  static Color get navbarUnSelectTextColor => _themeMode == ThemeMode.light
      ? const Color(0xFF9E9E9E)
      : Colors.grey[400]!;

  // --------------------------
  // Ekstra icon/renkler
  // --------------------------
  static Color get yellowCircle => _themeMode == ThemeMode.light
      ? const Color(0xFFFFF4D9)
      : Colors.grey[700]!;
  static Color get greenCircle => _themeMode == ThemeMode.light
      ? const Color(0xFFD1FAE5)
      : Colors.grey[800]!;
  static Color get greenIcon => _themeMode == ThemeMode.light
      ? const Color(0xFF5FD9A3)
      : const Color(0xFF81C784);
  static Color get yellowIcon => deepOrange;

  static Color get softPurple => _themeMode == ThemeMode.light
      ? const Color(0xFFF3E8FF)
      : Colors.grey[800]!;
  static Color get lightYellow => _themeMode == ThemeMode.light
      ? const Color(0xFFFEF3C7)
      : Colors.grey[800]!;
  static Color get lightPink => _themeMode == ThemeMode.light
      ? const Color(0xFFFEE2E2)
      : Colors.grey[800]!;

  static Color get deepOrange => const Color(0xFFEA9C06);
  static Color get darkRed => const Color(0xFFDC2626);
  static Color get deepPurple => _themeMode == ThemeMode.light
      ? const Color(0xFF9646EB)
      : const Color(0xFFB388FF);

  static Color get cardDefaultColor => _themeMode == ThemeMode.light
      ? const Color(0xFFF8FAFC)
      : Colors.grey[850]!;

  static Color get pageBackground =>
      _themeMode == ThemeMode.light ? const Color(0xFFF2F2F7) : Colors.black;

  static Color get tabBarIndicatorColor => _themeMode == ThemeMode.light
      ? const Color(0xFFE3F2FD)
      : Colors.grey[800]!;

  static Color get textSecondary => _themeMode == ThemeMode.light
      ? const Color(0xFF757575)
      : Colors.grey[400]!;

  /// Sistem çubuğu arka planı (StatusBar)
  static Color get statusBarColor =>
      _themeMode == ThemeMode.light ? Colors.white : Colors.black;

  /// Sistem çubuğu ikon parlaklığı (açık temada koyu ikonlar vs.)
  static Brightness get statusBarIconBrightness =>
      _themeMode == ThemeMode.light ? Brightness.dark : Brightness.light;

  // --------------------------
  // Leave Durum Renkleri (İzin)
  // --------------------------
  static Color get leaveApproved => _themeMode == ThemeMode.light
      ? const Color(0xFF2E7D32)
      : const Color(0xFF43A047); // Dark: Daha canlı yeşil

  static Color get leaveApprovedBg => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF1B5E20).withOpacity(0.3); // Koyu zemin

  static Color get leaveRejected => _themeMode == ThemeMode.light
      ? const Color(0xFFC62828)
      : const Color(0xFFEF5350);

  static Color get leaveRejectedBg => _themeMode == ThemeMode.light
      ? const Color(0xFFFFCDD2)
      : const Color(0xFFB71C1C).withOpacity(0.3);

  static Color get leavePending => _themeMode == ThemeMode.light
      ? const Color(0xFFF9A825)
      : const Color(0xFFF9A825);

  static Color get leavePendingBg => _themeMode == ThemeMode.light
      ? const Color(0xFFFFF9C4) // Açık sarı (Light)
      : const Color(0xFFFFF176); // Yumuşak sarı (Dark)

  static Color get leaveUnknown => _themeMode == ThemeMode.light
      ? const Color(0xFF757575)
      : const Color(0xFFBDBDBD);

  static Color get leaveUnknownBg => _themeMode == ThemeMode.light
      ? const Color(0xFFE0E0E0)
      : const Color(0xFF424242);

  // Event Status Colors
  static Color get eventPassed => _themeMode == ThemeMode.light
      ? const Color(0xFFDC2626) // Light kırmızı
      : const Color(0xFFEF5350); // Dark kırmızı (açık)

  static Color get eventToday => _themeMode == ThemeMode.light
      ? const Color(0xFF16A34A) // Light yeşil
      : const Color(0xFF66BB6A); // Dark yeşil (açık)

  static Color get eventUpcoming => _themeMode == ThemeMode.light
      ? const Color(0xFFF59E0B) // Light sarı
      : const Color(0xFFFFB74D); // Dark sarı (açık)

  // Status Text Colors
  static Color get statusApprovedText => _themeMode == ThemeMode.light
      ? Colors.green.shade700
      : Colors.green.shade300;

  static Color get statusRejectedText =>
      _themeMode == ThemeMode.light ? Colors.red.shade700 : Colors.red.shade300;

  static Color get statusPendingText => _themeMode == ThemeMode.light
      ? const Color(0xFFF59E0B)
      : const Color(0xFFFFB74D);

  static Color get statusUnknownText => _themeMode == ThemeMode.light
      ? Colors.grey.shade600
      : Colors.grey.shade400;

  // Expense Status Colors
  static Color get expenseApproved => _themeMode == ThemeMode.light
      ? const Color(0xFF16A34A)
      : const Color(0xFF81C784); // Açık yeşil (dark mode)

  static Color get expensePending => _themeMode == ThemeMode.light
      ? const Color(0xFFF59E0B)
      : const Color(0xFFFFB74D); // Açık sarı (dark mode)

  static Color get expenseRejected => _themeMode == ThemeMode.light
      ? const Color(0xFFDC2626)
      : const Color(0xFFEF5350); // Açık kırmızı (dark mode)

  static Color get expenseUnknown =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey.shade400;

  // Shift Status Colors
  static Color get shiftApproved => _themeMode == ThemeMode.light
      ? const Color(0xFF16A34A)
      : const Color(0xFF81C784);

  static Color get shiftPending => _themeMode == ThemeMode.light
      ? const Color(0xFFF59E0B)
      : const Color(0xFFFFB74D);

  static Color get shiftRejected => _themeMode == ThemeMode.light
      ? const Color(0xFFDC2626)
      : const Color(0xFFEF5350);

  static Color get shiftUnknown =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey.shade400;

  // AppColors içinde, tema uyumlu renkler

  static Color get payrollBackground =>
      _themeMode == ThemeMode.light ? Colors.white : const Color(0xFF1E1E1E);

  static Color get payrollBorder => _themeMode == ThemeMode.light
      ? Colors.grey.shade300
      : Colors.grey.shade700;

  static Color get payrollGrossSalaryBg => _themeMode == ThemeMode.light
      ? const Color(0xFFD9EEFB)
      : const Color(0xFF145374);

  static Color get payrollGrossSalaryText => _themeMode == ThemeMode.light
      ? const Color(0xFF007BBD)
      : const Color(0xFF90CAF9);

  static Color get payrollNetSalaryBg => _themeMode == ThemeMode.light
      ? const Color(0xFFDFF6E3)
      : const Color(0xFF2F4F2F);

  static Color get payrollNetSalaryText => _themeMode == ThemeMode.light
      ? const Color(0xFF28A745)
      : const Color(0xFFA5D6A7);

  static Color get payrollEmployerCostBg => _themeMode == ThemeMode.light
      ? const Color(0xFFFBE4E4)
      : const Color(0xFF542424);

  static Color get payrollEmployerCostText => _themeMode == ThemeMode.light
      ? const Color(0xFFD9534F)
      : const Color(0xFFEF9A9A);

  static Color get payrollAvatarBg => _themeMode == ThemeMode.light
      ? const Color(0xFF3B82F6)
      : const Color(0xFF90CAF9);

  static Color get payrollTextPrimary =>
      _themeMode == ThemeMode.light ? Colors.black87 : Colors.white70;

  static Color get payrollTextSecondary =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey.shade400;

  static Color get borderColor => _themeMode == ThemeMode.light
      ? Colors.grey.shade300
      : Colors.grey.shade700;

  static Color get dividerColor => _themeMode == ThemeMode.light
      ? Colors.grey.shade300
      : Colors.grey.shade700;

  static Color? get purple => null;

  static Color? get payrollItemBackground => null;

  // Profil ekranı özel renkler
  static Color get profileBackground => _themeMode == ThemeMode.light
      ? const Color(
          0xFFF8FAFC,
        ) // açık tema arka planı (örneğin cardDefaultColor ile aynı)
      : Colors.grey[850]!; // koyu tema arka planı

  static Color get profileCardBackground => cardDefaultColor;

  static Color get profileTabIndicatorColor => tabBarIndicatorColor;

  static Color get profileTabIndicatorShadow => _themeMode == ThemeMode.light
      ? Colors.blue.withOpacity(0.15)
      : Colors.blue.withOpacity(
          0.15,
        ); // koyu tema için farklı opacity veya renk verilebilir

  static Color get profileTabIndicatorBorder =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey[600]!;

  static Color get profileTabLabelSelected => textBlack;

  static Color get profileTabLabelUnselected => _themeMode == ThemeMode.light
      ? const Color(0xFF616161) // grey.shade600 alternatifi
      : Colors.grey[400]!;

  static Color get profileCardTitleColor => textBlack;

  static Color get profileCardSubtitleColor => textSecondary;

  static Color get incentiveCardBackground =>
      _themeMode == ThemeMode.light ? Colors.white : const Color(0xFF1E1E1E);

  static Color get incentiveCardBorder => _themeMode == ThemeMode.light
      ? Colors.grey.shade300
      : Colors.grey.shade700;

  static Color get incentiveTitleColor =>
      _themeMode == ThemeMode.light ? Colors.black87 : Colors.white70;

  static Color get incentiveLabelColor => _themeMode == ThemeMode.light
      ? Colors.grey.shade800
      : Colors.grey.shade300;

  static Color get incentiveHintColor => _themeMode == ThemeMode.light
      ? Colors.grey.shade600
      : Colors.grey.shade400;

  static Color get incentiveButtonBackground => _themeMode == ThemeMode.light
      ? const Color(0xFF4F9CF9)
      : const Color(0xFF90CAF9);

  static Color get incentiveButtonForeground => Colors.white;

  static Color get incentiveInfoIconColor =>
      _themeMode == ThemeMode.light ? Colors.grey : Colors.grey.shade400;

  static Color get incentiveInfoTextColor => _themeMode == ThemeMode.light
      ? Colors.grey.shade600
      : Colors.grey.shade400;

  static Color get textHint => _themeMode == ThemeMode.light
      ? Colors.grey.shade500
      : Colors.grey.shade500;

  static Color get disabledGrey => _themeMode == ThemeMode.light
      ? Colors.grey.shade400
      : Colors.grey.shade700;

  static Color get primary => _themeMode == ThemeMode.light
      ? const Color(0xFF673AB7) // Deep Purple
      : const Color(0xFF9575CD);

  static Color get primaryLight => _themeMode == ThemeMode.light
      ? const Color(0xFFD1C4E9)
      : const Color(0xFFB39DDB);

  static Color get accent => _themeMode == ThemeMode.light
      ? Colors.pinkAccent.shade400
      : Colors.pink.shade300;

  static Color get accentLight => _themeMode == ThemeMode.light
      ? const Color(0xFFF8BBD0)
      : const Color(0xFFF8BBD0);

  static Color get error =>
      _themeMode == ThemeMode.light ? Colors.redAccent : Colors.redAccent;

  static Color get secondaryLight => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF2E7D32);

  static Color get secondary => _themeMode == ThemeMode.light
      ? const Color(0xFF388E3C)
      : const Color(0xFFA5D6A7);

  static Color get errorLight => _themeMode == ThemeMode.light
      ? const Color(0xFFFFCDD2)
      : const Color(0xFFC62828);

  static Color get shiftTotal => _themeMode == ThemeMode.light
      ? const Color(0xFF1976D2) // Mavi
      : const Color(0xFF90CAF9);

  static Color get shiftTotalBg => _themeMode == ThemeMode.light
      ? const Color(0xFFBBDEFB)
      : const Color(0xFF0D47A1).withOpacity(0.3);

  static Color get shiftWage => _themeMode == ThemeMode.light
      ? const Color(0xFF388E3C) // Yeşil
      : const Color(0xFFA5D6A7);

  static Color get shiftWageBg => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF1B5E20).withOpacity(0.3);

  static Color get shiftApprovedBg => _themeMode == ThemeMode.light
      ? const Color(0xFFFFCDD2)
      : const Color(0xFFB71C1C).withOpacity(0.3);

  static Color get payrollGrossBg => _themeMode == ThemeMode.light
      ? const Color(0xFFBBDEFB)
      : const Color(0xFF0D47A1).withOpacity(0.3);

  static Color get payrollGrossText => _themeMode == ThemeMode.light
      ? const Color(0xFF1976D2)
      : const Color(0xFF90CAF9);

  static Color get payrollNetBg => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF1B5E20).withOpacity(0.3);

  static Color get payrollNetText => _themeMode == ThemeMode.light
      ? const Color(0xFF388E3C)
      : const Color(0xFFA5D6A7);

  static Color get payrollCostBg => _themeMode == ThemeMode.light
      ? const Color(0xFFB3E5FC)
      : const Color(0xFF263238); // Koyu mavi ton

  static Color get payrollCostText => _themeMode == ThemeMode.light
      ? Colors.blue.shade700
      : const Color(0xFF81D4FA);

  static Color get payrollApprovedBg => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF1B5E20).withOpacity(0.3);

  static Color get payrollApprovedText => _themeMode == ThemeMode.light
      ? const Color(0xFF388E3C)
      : const Color(0xFFA5D6A7);

  static Color get payrollExpenseBg => _themeMode == ThemeMode.light
      ? const Color(0xFFD1C4E9)
      : const Color(0xFF4527A0).withOpacity(0.3);

  static Color get payrollExpenseText => _themeMode == ThemeMode.light
      ? const Color(0xFF512DA8)
      : const Color(0xFFB39DDB);

  // Etkinlik kartları (Event Cards)
  static Color get eventTotalBg => _themeMode == ThemeMode.light
      ? const Color(0xFFBBDEFB)
      : const Color(0xFF0D47A1).withOpacity(0.3);

  static Color get eventTotalText => _themeMode == ThemeMode.light
      ? const Color(0xFF1976D2)
      : const Color(0xFF90CAF9);

  static Color get eventTodayBg => _themeMode == ThemeMode.light
      ? const Color(0xFFFFF9C4)
      : const Color(0xFFF57F17).withOpacity(0.3);

  static Color get eventTodayText => _themeMode == ThemeMode.light
      ? const Color(0xFFFBC02D)
      : const Color(0xFFFFF59D);

  static Color get eventUpcomingBg => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF1B5E20).withOpacity(0.3);

  static Color get eventUpcomingText => _themeMode == ThemeMode.light
      ? const Color(0xFF388E3C)
      : const Color(0xFFA5D6A7);

  static Color get eventPastBg => _themeMode == ThemeMode.light
      ? const Color(0xFFFFCDD2)
      : const Color(0xFFB71C1C).withOpacity(0.3);

  static Color get eventPastText => _themeMode == ThemeMode.light
      ? const Color(0xFFD32F2F)
      : const Color(0xFFEF9A9A);

  // Avans Kartları (Advance Cards)
  static Color get advanceApprovedBg => _themeMode == ThemeMode.light
      ? const Color(0xFFC8E6C9)
      : const Color(0xFF1B5E20).withOpacity(0.3);

  static Color get advanceApprovedText => _themeMode == ThemeMode.light
      ? const Color(0xFF388E3C)
      : const Color(0xFFA5D6A7);

  static Color get advanceTotalBg => _themeMode == ThemeMode.light
      ? const Color(0xFFD1C4E9)
      : const Color(0xFF311B92).withOpacity(0.3);

  static Color get advanceTotalText => _themeMode == ThemeMode.light
      ? const Color(0xFF512DA8)
      : const Color(0xFFB39DDB);

  static Color get green => _themeMode == ThemeMode.light
      ? const Color(0xFF4CAF50)
      : const Color(0xFFA5D6A7);

  static Color get infoRed => _themeMode == ThemeMode.light
      ? const Color(0xFFD32F2F)
      : const Color(0xFFEF9A9A);

  static Color get blueAccent => _themeMode == ThemeMode.light
      ? const Color(0xFF448AFF)
      : const Color(0xFF82B1FF);

  static Color get deepOrangeDark => _themeMode == ThemeMode.light
      ? const Color(0xFFE64A19)
      : const Color(0xFFFFCCBC);
}