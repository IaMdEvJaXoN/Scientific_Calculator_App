import 'package:calc_x/features/settings_feature/presentation/widgets/custom_appBar.dart';
import 'package:calc_x/features/settings_feature/presentation/widgets/settings_builder.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(child: SettingsBuilder()),
    );
  }
}