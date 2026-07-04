import 'package:calc_x/core/routing/app_routes.dart';
import 'package:calc_x/core/routing/router.dart';
import 'package:calc_x/core/themes/app_themes.dart';
import 'package:calc_x/shared/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(appThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: CalcXAppRouter.routes,
      initialRoute: AppRoutes.splash,
      title: "CALC X",
      themeMode: themeProvider,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
