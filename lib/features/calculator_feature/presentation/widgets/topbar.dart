import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final void Function(String) onIconPressed;
  const TopBar({super.key, required this.onIconPressed});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Center(child: Text("DEG")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Center(child: Text("COMP")),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onIconPressed("history");
          },
          icon: Icon(Icons.history_rounded),
        ),
        IconButton(
          onPressed: () {
            widget.onIconPressed("settings");
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
