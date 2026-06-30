import 'package:calc_x/core/routing/app_routes.dart';
import 'package:calc_x/features/calculator_feature/presentation/screens/basic_calc_screen.dart';
import 'package:calc_x/features/history_feature/presentation/screens/historyscreen.dart';
import 'package:calc_x/features/settings_feature/presentation/screens/settings_screen.dart';
import 'package:calc_x/splash_screen.dart';
import 'package:flutter/material.dart';

class CalcXAppRouter {
  //Populate with routes i.e profile:(context) => const ProfileScreen(),

  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.basicCalcScreen: (context) => const CalcScreen(),
    AppRoutes.settings: (context) => const SettingsScreen(),
    AppRoutes.historyScreen: (context) => const Historyscreen(),
  };
}
