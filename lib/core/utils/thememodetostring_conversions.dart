import 'package:flutter/material.dart';

class ThemeModeToStringConversion {
  static ThemeMode toThemeMode(String thememode) {
    late ThemeMode mode;
    switch (thememode) {
      case "ThemeMode.light":
        mode = ThemeMode.light;
      case "ThemeMode.dark":
        mode = ThemeMode.dark;
      case "ThemeMode.system":
        mode = ThemeMode.system;
    }
    return mode;
  }
}
