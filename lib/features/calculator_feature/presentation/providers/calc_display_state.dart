class CalculatorDisplayState {
  final String expression;
  final String result;
  CalculatorDisplayState({this.expression = "", this.result = ""});
  CalculatorDisplayState copyWith({String? expression, String? result}) {
    return CalculatorDisplayState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
    );
  }
}
