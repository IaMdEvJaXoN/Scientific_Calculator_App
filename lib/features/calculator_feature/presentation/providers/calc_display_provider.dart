import 'package:calc_x/core/services/hive_service.dart';
import 'package:calc_x/features/calculator_feature/data/dataSource.dart';
import 'package:calc_x/features/calculator_feature/data/getresult_repository_impl.dart';
import 'package:calc_x/features/calculator_feature/domain/getresult_repository.dart';
import 'package:calc_x/features/calculator_feature/domain/getresult_usecase.dart';
import 'package:calc_x/features/calculator_feature/presentation/providers/calc_display_state.dart';
import 'package:calc_x/shared/providers/angle_mode_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final hiveStorageInstanceProvider = Provider<HiveStorage>((ref) {
  return HiveStorage();
});

final dataSourceProvider = Provider<CalculatorEngine>((ref) {
  final hives = ref.read(hiveStorageInstanceProvider);
  final angleMode = ref.read(angleModeProvider);
  return CalculatorEngine(hives, angleMode);
});

final getResultRepositoryProvider = Provider<GetresultRepository>((ref) {
  final dataSource = ref.read(dataSourceProvider);
  return GetresultRepositoryImpl(dataSource);
});

final getResultUseCaseProvider = Provider<GetresultUsecase>((ref) {
  final repositoryImpl = ref.read(getResultRepositoryProvider);
  return GetresultUsecase(repositoryImpl);
});

final expressionAndResultProvider =
    StateNotifierProvider<DisplayNotifier, CalculatorDisplayState>((ref) {
      final usecase = ref.read(getResultUseCaseProvider);
      return DisplayNotifier(getSolutionUsecase: usecase);
    });

class DisplayNotifier extends StateNotifier<CalculatorDisplayState> {
  final GetresultUsecase getSolutionUsecase;

  DisplayNotifier({required this.getSolutionUsecase})
    : super(CalculatorDisplayState());

  void updateUserInput(String input) {
    state = state.copyWith(expression: '${state.expression}$input', result: "");
  }

  void getResult() {
    if (state.expression.isEmpty) {
      return;
    }
    _evaluateExpression();
  }

  Future<void> _evaluateExpression() async {
    final resultFromEvaluator = await getSolutionUsecase(state.expression);
    state = state.copyWith(result: resultFromEvaluator.result.toString());
  }

  void clearAllInput() {
    if (state.expression.isEmpty) {
      return;
    }
    state = state.copyWith(expression: '', result: '');
  }

  void backSpace() {
    if (state.expression.isEmpty) {
      return;
    }
    final exp = state.expression;
    state = state.copyWith(
      expression: exp.substring(0, exp.length - 1),
      result: '',
    );
  }
}
