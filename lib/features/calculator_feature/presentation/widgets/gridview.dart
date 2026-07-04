import 'package:calc_x/shared/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsGrid extends ConsumerStatefulWidget {
  final List<String> buttons;
  final Function(String) onButtonPressed;
  const ButtonsGrid({
    super.key,
    required this.buttons,
    required this.onButtonPressed,
  });

  @override
  ConsumerState<ButtonsGrid> createState() => _ButtonsGridState();
}

class _ButtonsGridState extends ConsumerState<ButtonsGrid> {
  @override
  Widget build(BuildContext context) {
    final List<String> gridButtons = widget.buttons;
    final myAppThemeProvider = ref.watch(appThemeProvider);
    final isDark = myAppThemeProvider == ThemeMode.dark ? true : false;

    return GridView.builder(
      padding: EdgeInsets.all(10),
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
        } else if (buttonText == "MODE") {
          isDark
              ? backGroundColor = const Color(0xFF6471B5)
              : backGroundColor = const Color(0xFF163CFA);
        } else if (buttonText == "⇄" || buttonText == "ANS") {
          isDark
              ? backGroundColor = const Color(0xFF6671AB)
              : backGroundColor = const Color(0xFF6671AB);
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
              style: ["DEL", "□⁄□"].contains(buttonText)
                  ? Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 24)
                  : ["f↔d", "ANS"].contains(buttonText)
                  ? Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 22)
                  : buttonText == "MODE"
                  ? Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 14)
                  : Theme.of(context).textTheme.labelLarge,
            ),
          ),
        );
      },
    );
  }
}
