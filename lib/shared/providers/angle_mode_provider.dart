import 'package:flutter_riverpod/legacy.dart';

final angleModeProvider = StateNotifierProvider<AngleNotifier, String>((_) {
  return AngleNotifier();
});

class AngleNotifier extends StateNotifier<String> {
  AngleNotifier() : super("DEG");

  void updateMode() {
    state == "DEG" ? state = "RAD" : state = "DEG";
    return;
  }
}
