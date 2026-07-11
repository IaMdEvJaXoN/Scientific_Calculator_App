import 'dart:math' as math;
import 'package:calc_x/core/services/hive_service.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorEngine {
  final HiveStorage hive;
  final GrammarParser parser;
  final String degreeMode;
  num _previousAns = 0.0;
  CalculatorEngine(this.hive, this.degreeMode)
    : parser = GrammarParser(
        ParserOptions(
          implicitMultiplication:
              false, //The package does not support it currently
          constants: {'π': math.pi, 'e': math.e},
        ),
      );

  dynamic evaluate(String expressionToEvaluate) {
    try {
      if (_previousAns == 0.0) {
        final input = _normalize(expressionToEvaluate);
        final expression = parser.parse(input);
        final context = ContextModel()..bindVariableName("Ans", Number(0));
        final evaluator = RealEvaluator(context);
        final result = evaluator.evaluate(expression);
        if (result.isNaN || result.isInfinite) {
          throw FormatException('Math Error');
        }
        final time = DateTime.now();
        final expressionToSave = "$expressionToEvaluate~$result~$time";
        _saveDataToHive(expressionToSave);
        _previousAns = result;
        return result;
      } else {
        final input = _normalize(expressionToEvaluate);
        final expression = parser.parse(input);
        final context = ContextModel()
          ..bindVariableName("Ans", Number(_previousAns));
        final evaluator = RealEvaluator(context);
        final result = evaluator.evaluate(expression);
        if (result.isNaN || result.isInfinite) {
          throw FormatException('Math Error');
        }
        final time = DateTime.now();
        final expressionToSave = "$expressionToEvaluate~$result~$time";
        _saveDataToHive(expressionToSave);
        _previousAns = result;
        return result;
      }
    } on FormatException {
      return "Syntax Error";
    } on StateError {
      return "Syntax Error";
    } catch (_) {
      return "Math Error";
    }
  }

  Future<void> _saveDataToHive(String expression) async {
    await hive.saveHistory(expression);
  }

  String _normalize(String text) {
    var expression = text.trim();

    expression = expression
        .replaceAll('x', '*')
        .replaceAll('÷', '/')
        .replaceAll('-', '-')
        .replaceAll('π', 'pi')
        .replaceAll('²', '^2')
        .replaceAll('³', '^3')
        .replaceAll('√(', 'sqrt(')
        .replaceAll('√', 'sqrt');

    expression = expression
        // Number adjacent to an open parenthesis: 2(3) -> 2*(3)
        .replaceAllMapped(RegExp(r'(\d)\('), (m) => '${m.group(1)}*(')
        // Close parenthesis adjacent to a number: (2)3 -> (2)*3
        .replaceAllMapped(RegExp(r'\)(\d)'), (m) => ')*${m.group(1)}')
        // Two parentheses adjacent: (2)(3) -> (2)*(3)
        .replaceAllMapped(RegExp(r'\)\('), (m) => ')*(')
        // Number adjacent to a letter (constants/functions): 2pi -> 2*pi, 3sin -> 3*sin
        .replaceAllMapped(
          RegExp(r'(\d)([a-zA-Z])'),
          (m) => '${m.group(1)}*${m.group(2)}',
        )
        // Close parenthesis adjacent to a letter: )pi -> )*pi, )sin -> )*sin
        .replaceAllMapped(RegExp(r'\)([a-zA-Z])'), (m) => ')*${m.group(1)}');

    expression = expression
        .replaceAll('asin(', 'arcsin(')
        .replaceAll('acos(', 'arccos(')
        .replaceAll('atan(', 'arctan(');

    expression = _convertLog10(expression);

    if (degreeMode=="DEG") {
      expression = _convertTrigDegreesToRadians(expression);
    }
    return expression;
  }

  String _convertLog10(String exp) {
    return exp.replaceAllMapped(
      RegExp(r'log\(([^()]+)\)'),
      (match) => 'log(10,${match.group(1)})',
    );
  }

  String _convertTrigDegreesToRadians(String exp) {
    final trigFunctions = ['sin', 'cos', 'tan'];

    for (final fn in trigFunctions) {
      exp = exp.replaceAllMapped(
        RegExp('$fn\\(([^()]+)\\)'),
        (match) => '$fn((${match.group(1)})*pi/180)',
      );
    }
    return exp;
  }
}
