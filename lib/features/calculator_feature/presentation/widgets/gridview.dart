import 'package:calc_x/features/calculator_feature/presentation/providers/calc_display_provider.dart';
import 'package:calc_x/shared/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsGrid extends ConsumerStatefulWidget {
  //final List<String> buttons;
  final Function(String) onButtonPressed;
  const ButtonsGrid({
    super.key,
    //required this.buttons,
    required this.onButtonPressed,
  });

  @override
  ConsumerState<ButtonsGrid> createState() => _ButtonsGridState();
}

class _ButtonsGridState extends ConsumerState<ButtonsGrid> {
  @override
  Widget build(BuildContext context) {
    //final List<String> gridButtons = widget.buttons;
    final myAppThemeProvider = ref.watch(appThemeProvider);
    final isDark = myAppThemeProvider == ThemeMode.dark ? true : false;
    final List<String> gridButtons = ref.watch(calcButtonsProvider).buttons;

    return GridView.builder(
      padding: EdgeInsets.all(15),
      itemCount: gridButtons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        Color backGroundColor = Theme.of(context).colorScheme.surface;
        final buttonText = gridButtons[index];
        if (buttonText == "DEL" || buttonText == "AC") {
          isDark
              ? backGroundColor = const Color(0xFF8B0000)
              : backGroundColor = const Color(0xFFEBA4A4);
        } else if (["x", "÷", "+", "-"].contains(buttonText)) {
          isDark
              ? backGroundColor = const Color(0xFF076D79)
              : backGroundColor = const Color(0xFFB1C2C3);
        } else if (buttonText == "=") {
          isDark
              ? backGroundColor = const Color(0xFF115875)
              : backGroundColor = const Color(0xFF016878);
        } else if (buttonText == "⇄" || buttonText == "Ans") {
          isDark
              ? backGroundColor = const Color(0xFF6671AB)
              : backGroundColor = const Color(0xFF6671AB);
        } else if ([
          "2nd",
          "sin(",
          "cos(",
          "tan(",
          "sin⁻¹(",
          "cos⁻¹(",
          "tan⁻¹(",
        ].contains(buttonText)) {
          isDark
              ? backGroundColor = const Color.fromARGB(255, 1, 11, 57)
              : backGroundColor = const Color.fromARGB(255, 77, 98, 220);
        } else if (["π", "e"].contains(buttonText)) {
          isDark
              ? backGroundColor = const Color.fromARGB(255, 48, 30, 14)
              : backGroundColor = const Color.fromARGB(255, 78, 19, 3);
        } else if ([
          ",",
          "X",
          "Y",
          "log(b,m)",
          ".",
          "!",
          "^",
          "(",
          ")",
        ].contains(buttonText)) {
          isDark
              ? backGroundColor = const Color.fromARGB(255, 51, 51, 60)
              : backGroundColor = const Color.fromARGB(255, 41, 45, 63);
        } else if (buttonText == "f↔d") {
          isDark
              ? backGroundColor = const Color.fromARGB(255, 43, 65, 66)
              : backGroundColor = const Color.fromARGB(255, 34, 50, 54);
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            widget.onButtonPressed(gridButtons[index]);
          },
          child: Center(
            child: Text(
              gridButtons[index],
              style:
                  [
                    "DEL",
                    "cos(",
                    "sin(",
                    "tan(",
                    "2nd",
                    "sin⁻¹(",
                    "cos⁻¹(",
                    "tan⁻¹(",
                  ].contains(buttonText)
                  ? Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 20)
                  : ["f↔d", "Ans"].contains(buttonText)
                  ? Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 18)
                  : buttonText == "log(b,m)"
                  ? Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 16)
                  : Theme.of(context).textTheme.labelLarge,
            ),
          ),
        );
      },
    );
  }
}
