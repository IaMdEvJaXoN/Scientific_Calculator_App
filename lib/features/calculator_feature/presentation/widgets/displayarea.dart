import 'Package:flutter/material.dart';

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
        color: const Color.fromARGB(35, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(0, 255, 255, 255),
              margin: EdgeInsets.all(16),
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
              color: const Color.fromARGB(0, 255, 255, 255),
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
