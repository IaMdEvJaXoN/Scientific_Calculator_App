import 'package:calc_x/features/calculator_feature/domain/query_entity.dart';

abstract class GetresultRepository {
  Future<QueryEntity> getResultUseCase(String mathExpression,num ans);
}
