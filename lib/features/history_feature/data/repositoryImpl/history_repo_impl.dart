import 'package:calc_x/features/history_feature/data/datasource/localstorage.dart';
import 'package:calc_x/features/history_feature/data/model/HistoryModel.dart';
import 'package:calc_x/features/history_feature/domain/entity/history_entity.dart';
import 'package:calc_x/features/history_feature/domain/repository.dart/history_repo.dart';

class HistoryRepoImpl implements HistoryRepo {
  final LocalStorage datasource;
  HistoryRepoImpl(this.datasource);

  @override
  Future<HistoryEntity> getHistoryUseCase() {
    // fetch data
    final dataFromDataSource = datasource.getHistory();

    //convert to Model object
    final dataSourceInModelFormat = Historymodel.convertToModelObject(
      dataFromDataSource,
    );

    //Convert to entity then send data back to usecase.
    final toEntity = dataSourceInModelFormat.convertToHistoryEntityFormat();
    return Future.value(toEntity);
  }

  @override
  Future<void> clearAllHistoryUseCase() async {
    await datasource.clearEverythingInHive();
    return Future.value();
  }

  @override
  Future<void> deleteHistoryItem(int index) async {
    return datasource.deleteItem(index);
  }
}
