import 'package:calc_x/core/services/shared_prefs.dart';
import 'package:calc_x/shared/providers/theme_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final angleModeProvider = StateNotifierProvider<AngleNotifier, String>((ref) {
  final prefs = ref.read(sharedPrefsProvider);
  return AngleNotifier(preferences: prefs);
});

class AngleNotifier extends StateNotifier<String> {
  final SharedPrefs preferences;
  AngleNotifier({required this.preferences}) : super("DEG") {
    loadSavedAngleMode();
  }

  Future<void> loadSavedAngleMode() async {
    state = await preferences.loadAngleMode();
  }

  Future<void> updateMode() async {
    state == "DEG" ? state = "RAD" : state = "DEG";
    await preferences.saveAngleMode(state);
  }
}
