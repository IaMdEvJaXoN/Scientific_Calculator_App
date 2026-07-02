import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/core/utils/calc_buttons.dart';
import 'package:calc_x/features/calculator_feature/presentation/widgets/displayArea.dart';
import 'package:calc_x/features/calculator_feature/presentation/widgets/gridview.dart';
import 'package:calc_x/features/calculator_feature/presentation/widgets/topbar.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  void buttonPressed(String value) {
    //Handle the string parsed by the gridview
  }
  @override
  Widget build(BuildContext context) {
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
                child: TopBar(),
              ),
            ),

            Expanded(flex: 5, child: DisplayArea()),

            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: DarkColors.gridColorforLightandDarkModes,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ButtonsGrid(
                  buttons: CalcButtons.basicCalcButtons,
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
