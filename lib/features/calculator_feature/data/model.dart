import 'package:calc_x/features/calculator_feature/domain/query_entity.dart';

class QuerryModel {
  final String resultFromMathEngine;
  QuerryModel({required this.resultFromMathEngine});

  //Conversion of data from calculator engine into model format
  factory QuerryModel.toModelFormat(dynamic answerFromEngine) {
    return QuerryModel(resultFromMathEngine: answerFromEngine.toString());
  }

  //conversion of data from model format to entity format
  QueryEntity toQuerryEntityFormat() {
    return QueryEntity(result: resultFromMathEngine);
  }
}
