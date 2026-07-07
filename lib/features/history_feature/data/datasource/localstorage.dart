import 'package:calc_x/core/services/hive_service.dart';

class LocalStorage {
  final HiveStorage hive;
  LocalStorage(this.hive);

  //Get history
  List<String> getHistory() {
    final List<String> allData = _fetchHistory();
    return allData;
  }

  List<String> _fetchHistory() {
    return hive.getHistory().toList();
  }

  //Clear All History
  Future<void> clearEverythingInHive() async {
    hive.clearAllEntriesInHiveBox();
  }

  //Delete a single entry in Hive
  Future<void> deleteItem(int index) async {
    await hive.removeSingleItemFromHiveBox(index);
  }
}
