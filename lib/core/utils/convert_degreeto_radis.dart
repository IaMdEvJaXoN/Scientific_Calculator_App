class ConvertDegreetoRad {
  static String convertDegreeNumbersToRadians(String expression) {
    final trigFunctions = {"sin", "cos", "tan", "sin⁻¹", "cos⁻¹", "tan⁻¹"};

    final buffer = StringBuffer();

    int i = 0;
    int trigDepth = 0;

    while (i < expression.length) {
      // Detect trig functions
      bool foundTrig = false;
      for (final fn in trigFunctions) {
        if (expression.startsWith("$fn(", i)) {
          buffer.write("$fn(");
          trigDepth++;
          i += fn.length + 1; // skip "fn("
          foundTrig = true;
          break;
        }
      }

      if (foundTrig) continue;

      // Leaving a trig call
      if (expression[i] == ')') {
        if (trigDepth > 0) {
          trigDepth--;
        }
        buffer.write(')');
        i++;
        continue;
      }

      // Convert numbers only while inside trig
      if (trigDepth > 0 && RegExp(r'[0-9.]').hasMatch(expression[i])) {
        int start = i;

        while (i < expression.length &&
            RegExp(r'[0-9.]').hasMatch(expression[i])) {
          i++;
        }

        final number = expression.substring(start, i);

        buffer.write("($number*pi/180)");
        continue;
      }

      buffer.write(expression[i]);
      i++;
    }

    return buffer.toString();
  }
}
