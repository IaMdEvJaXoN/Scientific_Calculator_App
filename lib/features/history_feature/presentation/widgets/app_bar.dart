import 'package:calc_x/features/history_feature/presentation/providers/history_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const HistoryAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<HistoryAppBar> createState() => _HistoryAppBarState();
}

class _HistoryAppBarState extends ConsumerState<HistoryAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: Center(
        child: Text("HISTORY", style: Theme.of(context).textTheme.titleLarge),
      ),
      actions: [
        TextButton.icon(
          onPressed: () async {
            await ref.read(historyProvider.notifier).clearAllHistoryEntries();
          },
          label: const Text("Clear"),
          icon: const Icon(Icons.delete_sweep_outlined, size: 30),
        ),
      ],
    );
  }
}
