import 'package:calc_x/core/services/shared_prefs.dart';
import 'package:calc_x/shared/providers/theme_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final decimalPlacesProvider = StateNotifierProvider<DecimalPlacesNotifier, int>(
  (ref) {
    final sharedPrefsReader = ref.read(sharedPrefsProvider);
    return DecimalPlacesNotifier(prefs: sharedPrefsReader);
  },
);

class DecimalPlacesNotifier extends StateNotifier<int> {
  final SharedPrefs prefs;
  DecimalPlacesNotifier({required this.prefs}) : super(0) {
    loadStoredDecimalPrecision();
  }
  void updateState(int newValue) async {
    state = newValue;
    await prefs.saveDecimalPrecision(newValue.toString());
  }

  Future<void> loadStoredDecimalPrecision() async {
    final precision = await prefs.loadDecimalPrecision();
    final prec = int.tryParse(precision);
    if (prec == null) {
      state = 5;
      return;
    } else {
      state = prec;
    }
  }
}
