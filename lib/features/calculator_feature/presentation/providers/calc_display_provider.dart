import 'package:calc_x/core/services/hive_service.dart';
import 'package:calc_x/core/utils/calc_buttons.dart';
import 'package:calc_x/core/utils/stringtodouble_conversion.dart';
import 'package:calc_x/features/calculator_feature/data/dataSource.dart';
import 'package:calc_x/features/calculator_feature/data/getresult_repository_impl.dart';
import 'package:calc_x/features/calculator_feature/domain/getresult_repository.dart';
import 'package:calc_x/features/calculator_feature/domain/getresult_usecase.dart';
import 'package:calc_x/features/calculator_feature/presentation/providers/calc_buttons_state.dart';
import 'package:calc_x/features/calculator_feature/presentation/providers/calc_display_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fraction/fraction.dart';

final hiveStorageInstanceProvider = Provider<HiveStorage>((ref) {
  return HiveStorage();
});

final dataSourceProvider = Provider<CalculatorEngine>((ref) {
  final hives = ref.read(hiveStorageInstanceProvider);
  return CalculatorEngine(hives);
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

  void getResult(String mode, int decimalsCount) {
    if (state.expression.isEmpty) {
      return;
    }
    _evaluateExpression(mode, decimalsCount);
  }

  Future<void> _evaluateExpression(String mode, int decimalsCount) async {
    final resultFromEvaluator = await getSolutionUsecase(
      state.expression,
      mode,
    );
    final ans = StringtodoubleConversion.convertToDouble(
      resultFromEvaluator.result,
    );
    if (ans == null) {
      state = state.copyWith(result: resultFromEvaluator.result.toString());
    } else {
      state = state.copyWith(result: ans.toStringAsFixed(decimalsCount));
    }
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

  void setResultToFraction() {
    if (state.result.isEmpty) return;

    final value = double.tryParse(state.result);
    if (value == null) return;
    final fraction = Fraction.fromDouble(value);
    state = state.copyWith(result: fraction.toString());
  }
}

final calcButtonsProvider =
    StateNotifierProvider<ButtonsListNotifier, CalcButtonsState>((ref) {
      return ButtonsListNotifier();
    });

class ButtonsListNotifier extends StateNotifier<CalcButtonsState> {
  ButtonsListNotifier()
    : super(CalcButtonsState(buttons: CalcGridButtons.basicCalcButtons));

  void updateOn2ndButtonPressed(bool isTrigMode) {
    if (!isTrigMode) {
      final List<String> calcButtons = state.buttons.toList();
      calcButtons[7] = "sin⁻¹(";
      calcButtons[8] = "cos⁻¹(";
      calcButtons[9] = "tan⁻¹(";
      state = state.copyWith(buttons: calcButtons);
    } else {
      final List<String> calcButtons = state.buttons.toList();
      calcButtons[7] = "sin(";
      calcButtons[8] = "cos(";
      calcButtons[9] = "tan(";
      state = state.copyWith(buttons: calcButtons);
    }
  }
}
