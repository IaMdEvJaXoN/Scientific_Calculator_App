import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  final Box<String> _box = Hive.box<String>("history");

  Future<void> saveHistory(String expressionToSave) async {
    await _box.add(expressionToSave);
  }

  List<String> getHistory() {
    return _box.values.toList();
  }

  Future<void> clearAllEntriesInHiveBox() async {
    await _box.clear();
  }

  Future<void> removeSingleItemFromHiveBox(int key) async {
    await _box.delete(key);
  }
}
