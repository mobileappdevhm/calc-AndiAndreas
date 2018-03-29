import "package:math_expressions/math_expressions.dart";

class MathParse {
  static String calculate(String input) {
    String result = "";
    Parser p = new Parser();

    if (input.length < 1) {
      result = "0";
    } else {
      try {
        Expression exp = p.parse(input);
        num number = exp.evaluate(EvaluationType.REAL, new ContextModel());
        // Only display digits after . if necessary
        if (number.ceil() == number.floor())
          result = number.toInt().toString();
        else
          result = number.toString();
      } catch (e) {
        result = "ERROR";
      }
    }

    return result;
  }
}