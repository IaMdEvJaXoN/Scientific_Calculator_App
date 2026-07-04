import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final appThemeProvider = StateNotifierProvider<AppThemeNotifier, ThemeMode>((
  ref,
) {
  return AppThemeNotifier();
});

class AppThemeNotifier extends StateNotifier<ThemeMode> {
  AppThemeNotifier() : super(ThemeMode.dark);

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
  }
}
