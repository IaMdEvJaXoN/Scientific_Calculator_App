import 'package:calc_x/features/calculator_feature/data/dataSource.dart';
import 'package:calc_x/features/calculator_feature/data/model.dart';
import 'package:calc_x/features/calculator_feature/domain/getresult_repository.dart';
import 'package:calc_x/features/calculator_feature/domain/query_entity.dart';

class GetresultRepositoryImpl implements GetresultRepository {
  final CalculatorEngine dataSource;
  GetresultRepositoryImpl(this.dataSource);

  @override
  Future<QueryEntity> getResultUseCase(String toBeEvaluated) async {
    //Fetch result
    final data = dataSource.evaluate(toBeEvaluated);
    //convert it to Model
    final querryModelFormat = QuerryModel.toModelFormat(data);
    //return as entity
    return querryModelFormat.toQuerryEntityFormat();
  }
}
