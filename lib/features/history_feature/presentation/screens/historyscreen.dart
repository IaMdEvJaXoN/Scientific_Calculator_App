import 'package:calc_x/features/history_feature/presentation/widgets/app_bar.dart';
import 'package:calc_x/features/history_feature/presentation/widgets/history_screen_body.dart';
import 'package:flutter/material.dart';

class Historyscreen extends StatefulWidget {
  const Historyscreen({super.key});

  @override
  State<Historyscreen> createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HistoryAppBar(),
      body: SafeArea(child: HistoryScreenBody()),
    );
  }
}
