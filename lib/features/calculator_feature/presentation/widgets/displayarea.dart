import 'Package:flutter/material.dart';
import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/features/calculator_feature/presentation/providers/calc_display_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayArea extends ConsumerStatefulWidget {
  const DisplayArea({super.key});

  @override
  ConsumerState<DisplayArea> createState() => _DisplayareaState();
}

class _DisplayareaState extends ConsumerState<DisplayArea> {
  @override
  Widget build(BuildContext context) {
    final displayAreaProvider = ref.watch(expressionAndResultProvider);
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
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: DarkColors.resultAndExpressionDisplayBackgnd,
                margin: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(
                  displayAreaProvider.result,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
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
                displayAreaProvider.expression,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
