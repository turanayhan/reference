import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final Box _box = Hive.box('settings');

  ThemeNotifier() : super(_getSavedTheme());

  static ThemeMode _getSavedTheme() {
    final box = Hive.box('settings');
    final savedIndex = box.get('themeMode', defaultValue: 0);
    return savedIndex == 0 ? ThemeMode.light : ThemeMode.dark;
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      _box.put('themeMode', 1);
    } else {
      state = ThemeMode.light;
      _box.put('themeMode', 0);
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});