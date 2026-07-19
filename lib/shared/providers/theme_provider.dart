import 'package:calc_x/core/services/shared_prefs.dart';
import 'package:calc_x/core/utils/thememodetostring_conversions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final sharedPrefsProvider = Provider((ref) {
  return SharedPrefs();
});

final appThemeProvider = StateNotifierProvider<AppThemeNotifier, ThemeMode>((
  ref,
) {
  final sharedPrefsReader = ref.read(sharedPrefsProvider);
  return AppThemeNotifier(prefs: sharedPrefsReader);
});

class AppThemeNotifier extends StateNotifier<ThemeMode> {
  final SharedPrefs prefs;
  AppThemeNotifier({required this.prefs}) : super(ThemeMode.dark) {
    loadAppThemeMode();
  }

  Future<void> loadAppThemeMode() async {
    final themeMode = await prefs.loadThemeMode();
    state = ThemeModeToStringConversion.toThemeMode(themeMode);
    //return Future.value();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await prefs.saveThemeMode(themeMode.toString());
  }
}
