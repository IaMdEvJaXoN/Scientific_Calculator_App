import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String themeKey = "theme";
  static const String angleModeKey = "angle_mode";
  static const String decimalPrecisionKey = "precision";
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  Future<String> loadThemeMode() async {
    return await _prefs.getString(themeKey) ?? "dark";
  }

  Future<void> saveThemeMode(String themeMode) async {
    await _prefs.setString(themeKey, themeMode);
  }

  Future<String> loadAngleMode() async {
    return await _prefs.getString(angleModeKey) ?? "DEG";
  }

  Future<void> saveAngleMode(String angleMode) async {
    await _prefs.setString(angleModeKey, angleMode);
  }

  Future<void> saveDecimalPrecision(String precision) async {
    await _prefs.setString(decimalPrecisionKey, precision);
  }

  Future<String> loadDecimalPrecision() async {
    return await _prefs.getString(decimalPrecisionKey) ?? "5";
  }
}
