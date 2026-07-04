import 'Package:flutter/material.dart';
import 'package:calc_x/core/themes/colors.dart';

class DisplayArea extends StatefulWidget {
  const DisplayArea({super.key});

  @override
  State<DisplayArea> createState() => _DisplayareaState();
}

class _DisplayareaState extends State<DisplayArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: DarkColors.displayAreaOutlineColor),
        color: DarkColors.displayAreaContainerBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: DarkColors.resultAndExpressionDisplayBackgnd,
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                "RESULT",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15),
              color: DarkColors.resultAndExpressionDisplayBackgnd,
              alignment: Alignment.bottomRight,
              child: Text(
                "EXPRESSION",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
