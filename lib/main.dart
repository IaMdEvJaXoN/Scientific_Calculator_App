import 'package:calc_x/core/routing/app_routes.dart';
import 'package:calc_x/core/routing/router.dart';
import 'package:calc_x/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: CalcXAppRouter.routes,
      initialRoute: AppRoutes.splash,
      title: "CALC X",
      themeMode: ThemeMode.dark,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
