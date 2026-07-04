import 'package:flutter/material.dart';

class HistoryAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HistoryAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<HistoryAppBar> createState() => _HistoryAppBarState();
}

class _HistoryAppBarState extends State<HistoryAppBar> {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: Center(child: Text("HISTORY", style: Theme.of(context).textTheme.titleLarge)),
      actions: [
        TextButton.icon(
          onPressed: () {},
          label: const Text("Clear"),
          icon: const Icon(Icons.delete_sweep_outlined,size: 30),
        ),
      ],
    );
  }
}
