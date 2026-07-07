import 'package:calc_x/features/history_feature/domain/entity/history_entity.dart';

class Historymodel {
  final List<String> historyModel;
  const Historymodel({required this.historyModel});
  //convert from data from DataSource format to HistoryModel object
  factory Historymodel.convertToModelObject(List<String> dataFromDataSource) {
    return Historymodel(historyModel: dataFromDataSource);
  }

  //Convert data to DataSource expectation
  

  //Convert data to HistoryEntity
  HistoryEntity convertToHistoryEntityFormat() {
    return HistoryEntity(calculationHistory: historyModel);
  }
}
