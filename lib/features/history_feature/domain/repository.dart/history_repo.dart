import 'package:calc_x/features/history_feature/domain/entity/history_entity.dart';

abstract class HistoryRepo {
  Future<HistoryEntity> getHistoryUseCase();
  Future<void> clearAllHistoryUseCase();
  Future<void> deleteHistoryItem(int index);
}
