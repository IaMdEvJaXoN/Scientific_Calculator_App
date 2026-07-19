import 'package:calc_x/shared/providers/angle_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends ConsumerStatefulWidget {
  final void Function(String) onIconPressed;
  const TopBar({super.key, required this.onIconPressed});

  @override
  ConsumerState<TopBar> createState() => _TopBarState();
}

class _TopBarState extends ConsumerState<TopBar> {
  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(angleModeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: ElevatedButton(
            onPressed: () {
              ref.read(angleModeProvider.notifier).updateMode();
            },
            child: Center(child: Text(mode)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("COMP"), Center(child: Icon(Icons.arrow_drop_down))],
            ),
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
