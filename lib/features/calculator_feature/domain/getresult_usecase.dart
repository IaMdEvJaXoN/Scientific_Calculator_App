import 'package:calc_x/features/calculator_feature/domain/getresult_repository.dart';
import 'package:calc_x/features/calculator_feature/domain/query_entity.dart';

class GetresultUsecase {
  final GetresultRepository repository;
  GetresultUsecase(this.repository);
  Future<QueryEntity> call(String mathExpression) async {
    return await repository.getResultUseCase(mathExpression);
  }
}
