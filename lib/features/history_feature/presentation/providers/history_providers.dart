import 'package:calc_x/core/services/hive_service.dart';
import 'package:calc_x/features/history_feature/data/datasource/localstorage.dart';
import 'package:calc_x/features/history_feature/data/repositoryImpl/history_repo_impl.dart';
import 'package:calc_x/features/history_feature/domain/repository.dart/history_repo.dart';
import 'package:calc_x/features/history_feature/domain/use_case/history_usecases.dart';
import 'package:calc_x/features/history_feature/presentation/providers/history_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final hiveProvider = Provider((Ref ref) {
  return HiveStorage();
});

final historyDataSourceProvider = Provider<LocalStorage>((Ref ref) {
  final hive = ref.read(hiveProvider);
  return LocalStorage(hive);
});

final historyRepositoryProvider = Provider<HistoryRepo>((Ref ref) {
  final dataSource = ref.read(historyDataSourceProvider);
  return HistoryRepoImpl(dataSource);
});

//Usecase providers
final getHistoryUseCaseProvider = Provider<GetHistoryUsecase>((Ref ref) {
  final repository = ref.read(historyRepositoryProvider);
  return GetHistoryUsecase(repository);
});

final clearAllHistoryUseCaseProvider = Provider<ClearEverythingUseCase>((ref) {
  final repository = ref.read(historyRepositoryProvider);
  return ClearEverythingUseCase(repository);
});

final deleteHistoryItemUseCaseProvider = Provider<DeleteHistoryItemUseCase>((
  ref,
) {
  final repository = ref.read(historyRepositoryProvider);
  return DeleteHistoryItemUseCase(repository);
});

//State provider
final historyProvider = StateNotifierProvider<HistoryNotifier, HistoryState>((
  Ref ref,
) {
  final getHistuseCase = ref.read(getHistoryUseCaseProvider);
  final clearAllHistUseCase = ref.read(clearAllHistoryUseCaseProvider);
  final deleteItemUseCase = ref.read(deleteHistoryItemUseCaseProvider);
  return HistoryNotifier(
    getEntireHistoryUsecase: getHistuseCase,
    clearEverythingUsecase: clearAllHistUseCase,
    deleteHistoryItemUsecase: deleteItemUseCase,
  );
});

class HistoryNotifier extends StateNotifier<HistoryState> {
  final GetHistoryUsecase getEntireHistoryUsecase;
  final ClearEverythingUseCase clearEverythingUsecase;
  final DeleteHistoryItemUseCase deleteHistoryItemUsecase;
  HistoryNotifier({
    required this.getEntireHistoryUsecase,
    required this.clearEverythingUsecase,
    required this.deleteHistoryItemUsecase,
  }) : super(HistoryState(history: []));
  Future<void> fetchHistoryToDisplay() async {
    final data = await getEntireHistoryUsecase();
    state = state.copyWith(history: data.calculationHistory);
  }

  Future<void> clearAllHistoryEntries() async {
    await clearEverythingUsecase();
    state = state.copyWith(history: []);
  }

  Future<void> removeItemFromHistory(int index) async {
    await deleteHistoryItemUsecase(index);
    await fetchHistoryToDisplay();
  }
}
