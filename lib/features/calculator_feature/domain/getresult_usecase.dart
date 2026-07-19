import 'package:calc_x/core/utils/convert_degreeto_radis.dart';
import 'package:calc_x/features/calculator_feature/domain/getresult_repository.dart';
import 'package:calc_x/features/calculator_feature/domain/query_entity.dart';

class GetresultUsecase {
  final GetresultRepository repository;
  GetresultUsecase(this.repository);
  Future<QueryEntity> call(String mathExpression, String mode) async {
    if (mode == "DEG") {
      final convertDegToRad = ConvertDegreetoRad.convertDegreeNumbersToRadians(
        mathExpression,
      );
      mathExpression = convertDegToRad;
    }

    return await repository.getResultUseCase(mathExpression);
  }
}
