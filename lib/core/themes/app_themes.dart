import 'package:calc_x/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    scaffoldBackgroundColor: DarkColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: DarkColors.primaryColor,
      secondary: DarkColors.secondaryColor,
      surface: DarkColors.surfaceColor,
    ),

    iconTheme: IconThemeData(color: DarkColors.iconColor),

    textTheme: TextTheme(
      // Large calculator result
      displayLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: DarkColors.displayLargeColor,
      ),

      // Calculator expression/history
      headlineLarge: TextStyle(
        fontSize: 24,
        color: DarkColors.headLineLargeColor,
      ),

      //titles
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),

      // Normal text
      bodyLarge: TextStyle(fontSize: 16),

      // Button labels
      labelLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: DarkColors.buttonTextColor,
      ),
    ),
  );

  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    scaffoldBackgroundColor: LightColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: LightColors.primaryColor,
      secondary: LightColors.secondaryColor,
      surface: LightColors.surfaceColor,
    ),

    iconTheme: IconThemeData(color: LightColors.iconColor),

    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),

      headlineLarge: TextStyle(fontSize: 24),

      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),

      bodyLarge: TextStyle(fontSize: 16),

      //Button labels
      labelLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: LightColors.buttonTextColor,
      ),
    ),
  );
}
