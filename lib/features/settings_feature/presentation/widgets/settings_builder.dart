import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/shared/providers/decimal_places_provider.dart';
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
    final decimalPlaces = ref.watch(decimalPlacesProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
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
                  child: Text("ThemeMode", style: TextStyle(fontSize: 20)),
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
                        label: Text("Dark", style: TextStyle(fontSize: 18)),
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
                        label: Text("Light", style: TextStyle(fontSize: 18)),
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
                        label: Text("System", style: TextStyle(fontSize: 18)),
                        icon: Icon(Icons.brightness_auto_outlined),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Decimal Precison", style: TextStyle(fontSize: 20)),
                    Text(
                      decimalPlaces.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Slider.adaptive(
                  value: decimalPlaces.toDouble(),
                  min: 0,
                  max: 15,
                  divisions: 15,
                  label: decimalPlaces.toString(),
                  onChanged: (value) {
                    ref
                        .read(decimalPlacesProvider.notifier)
                        .updateState(value.toInt());
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("assets/images/settings.png"),
                ),
              ),

              Center(
                child: Text("Version 1.0.0", style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
