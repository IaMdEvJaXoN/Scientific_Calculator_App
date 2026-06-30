import 'package:calc_x/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  //Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    useMaterial3: true,

    // Entire application background
    scaffoldBackgroundColor: DarkColors.darkBackground,

    colorScheme: ColorScheme.dark(
      // Main app accent
      // Used for:
      // - Equals button
      // - Active DEG/RAD
      // - Selected states
      // - Important actions
      primary: DarkColors.cyan,

      // Scientific/advanced accent
      // Used for:
      // - MODE
      // - 2nd
      // - Scientific buttons
      secondary: DarkColors.secondary,

      // Cards, containers, surfaces
      // Used for:
      // - History cards
      // - Settings cards
      // - Calculator containers
      surface: DarkColors.darkSurface,

      // Text/icons on cyan buttons
      onPrimary: Colors.black,

      // Text/icons on surfaces
      onSurface: DarkColors.textPrimary,

      // Error actions
      // Used for:
      // - DEL
      // - AC
      // - Delete history
      error: DarkColors.error,

      // Borders and dividers
      outline: DarkColors.outline,
    ),
  );
  //Light theme

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    useMaterial3: true,

    // Entire application background
    scaffoldBackgroundColor: LightColors.background,

    colorScheme: ColorScheme.light(
      // Main app accent
      // Equals button, active states, selected items
      primary: LightColors.primary,

      // Scientific/advanced accent
      // MODE, 2nd, scientific functions
      secondary: LightColors.secondary,

      // Cards, display containers, surfaces
      surface: LightColors.surface,

      // Text/icons on primary buttons
      onPrimary: Colors.white,

      // Main text on surfaces
      onSurface: LightColors.textPrimary,

      // Error actions
      // DEL, AC, destructive actions
      error: LightColors.errorColor,

      // Borders/dividers
      outline: LightColors.outline,
    ),
  );
}
