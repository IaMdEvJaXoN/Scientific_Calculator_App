import 'package:calc_x/core/routing/app_routes.dart';
import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/features/calculator_feature/presentation/providers/calc_display_provider.dart';
import 'package:calc_x/features/calculator_feature/presentation/widgets/displayArea.dart';
import 'package:calc_x/features/calculator_feature/presentation/widgets/gridview.dart';
import 'package:calc_x/features/calculator_feature/presentation/widgets/topbar.dart';
import 'package:calc_x/shared/providers/angle_mode_provider.dart';
import 'package:calc_x/shared/providers/decimal_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcScreen extends ConsumerStatefulWidget {
  const CalcScreen({super.key});

  @override
  ConsumerState<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends ConsumerState<CalcScreen> {
  bool inverseTrigMode = false;
  // gridButton callbacks
  void buttonPressed(String value) {
    final displayNotifierReader = ref.read(
      expressionAndResultProvider.notifier,
    );
    final angleModeReader = ref.read(angleModeProvider);
    final decimalsCount = ref.read(decimalPlacesProvider);
    if (value == "=") {
      displayNotifierReader.getResult(angleModeReader, decimalsCount);
    } else if (value == "2nd") {
      ref
          .read(calcButtonsProvider.notifier)
          .updateOn2ndButtonPressed(inverseTrigMode);
      inverseTrigMode = !inverseTrigMode;
    } else if (value == "f↔d") {
      displayNotifierReader.setResultToFraction();
    } else if (value == "DEL") {
      displayNotifierReader.backSpace();
    } else if (value == "AC") {
      displayNotifierReader.clearAllInput();
    } else if ([
      "(",
      ")",
      "7",
      "8",
      "9",
      "4",
      "5",
      "6",
      "x",
      "÷",
      "1",
      "2",
      "3",
      "+",
      "-",
      "0",
      ".",
      "log(b,m)",
      ",",
      "π",
      "e",
      "sin(",
      "cos(",
      "tan(",
      "sin⁻¹(",
      "cos⁻¹(",
      "tan⁻¹(",
      "!",
      "^",
      "(",
      ")",
      "Ans",
    ].contains(value)) {
      displayNotifierReader.updateUserInput(value);
    } else {
      return;
    }
  }

  //settings,history,light/dark mode icons callbacks
  void topBarIconPressed(String pressedIcon) {
    if (pressedIcon == "history") {
      Navigator.pushNamed(context, AppRoutes.historyScreen);
    } else if (pressedIcon == "settings") {
      Navigator.pushNamed(context, AppRoutes.settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    //final gridButtonsProvider = ref.watch(calcButtonsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: TopBar(onIconPressed: topBarIconPressed),
              ),
            ),

            Expanded(flex: 5, child: DisplayArea()),

            Expanded(
              flex: 11,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: DarkColors.gridColorforLightandDarkModes,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ButtonsGrid(
                  //buttons: gridButtonsProvider.buttons,
                  onButtonPressed: buttonPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
