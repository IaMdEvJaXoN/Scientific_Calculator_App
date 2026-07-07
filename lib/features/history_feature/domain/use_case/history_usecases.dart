import 'package:calc_x/features/history_feature/domain/entity/history_entity.dart';
import 'package:calc_x/features/history_feature/domain/repository.dart/history_repo.dart';

class GetHistoryUsecase {
  final HistoryRepo repository;
  GetHistoryUsecase(this.repository);
  Future<HistoryEntity> call() async {
    return await repository.getHistoryUseCase();
  }
}

class ClearEverythingUseCase {
  final HistoryRepo repository;
  ClearEverythingUseCase(this.repository);
  Future<void> call() async {
    return await repository.clearAllHistoryUseCase();
  }
}

class DeleteHistoryItemUseCase {
  final HistoryRepo repository;
  DeleteHistoryItemUseCase(this.repository);
  Future<void> call(int index) async {
    return await repository.deleteHistoryItem(index);
  }
}
