import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/shared/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsBuilder extends ConsumerStatefulWidget {
  const SettingsBuilder({super.key});

  @override
  ConsumerState<SettingsBuilder> createState() => _SettingsBuilderState();
}

class _SettingsBuilderState extends ConsumerState<SettingsBuilder> {
  @override
  Widget build(BuildContext context) {
    final appWideThemeProvider = ref.watch(appThemeProvider);
    final isDark = appWideThemeProvider == ThemeMode.dark ? true : false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDark
                ? const Color.fromARGB(255, 60, 58, 58)
                : const Color.fromARGB(255, 60, 58, 58),
            border: Border.all(
              width: 3,
              color: isDark
                  ? DarkColors.displayAreaOutlineColor
                  : Color.fromARGB(255, 42, 41, 41),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 3, 5, 3),
                alignment: Alignment.bottomLeft,
                child: Text("Theme Mode"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        iconColor: Color.fromARGB(255, 112, 156, 156),
                        backgroundColor: Color.fromARGB(255, 60, 58, 58),
                      ),
                      onPressed: () {
                        ref
                            .read(appThemeProvider.notifier)
                            .setThemeMode(ThemeMode.dark);
                      },
                      label: Text("Dark"),
                      icon: Icon(Icons.dark_mode_outlined),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        iconColor: Color.fromARGB(255, 112, 156, 156),
                        backgroundColor: Color.fromARGB(255, 60, 58, 58),
                      ),
                      onPressed: () {
                        ref
                            .read(appThemeProvider.notifier)
                            .setThemeMode(ThemeMode.light);
                      },
                      label: Text("Light"),
                      icon: Icon(Icons.light_mode_outlined),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        iconColor: Color.fromARGB(255, 112, 156, 156),
                        backgroundColor: Color.fromARGB(255, 60, 58, 58),
                      ),
                      onPressed: () {
                        ref
                            .read(appThemeProvider.notifier)
                            .setThemeMode(ThemeMode.system);
                      },
                      label: Text("System"),
                      icon: Icon(Icons.brightness_auto_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
