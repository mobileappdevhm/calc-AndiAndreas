import 'package:petitparser/petitparser.dart';

class MathParser {

  static Result _parse(String inputTerm) {
    var number = (char("-").optional() & digit() & (char('.') & digit())
        .optional()).plus().flatten().trim().map(double.parse);
    var term = undefined();
    var prod = undefined();
    var prim = undefined();

    term.set(prod.seq(char('+').trim()).seq(term).map((values) {
      return values[0] + values[2];
    }).or(prod.seq(char('-').trim()).seq(term).map((values) {
      return values[0] - values[2];
    }).or(prod)));
    prod.set(prim.seq(char('*').trim()).seq(prod).map((values) {
      return values[0] * values[2];
    }).or(prim.seq(char('/').trim()).seq(prod).map((values) {
      return values[0] / values[2];
    }).or(prim)));
    prim.set(char('(').trim().seq(term).seq(char(')'.trim())).map((values) {
      return values[1];
    }).or(number));

    var start = term.end();
    return start.parse(inputTerm);
  }

  static bool checkSyntax(String inputTerm) {
    return _parse(inputTerm).isSuccess;
  }

  static String calculateResult(String inputTerm) {
    var parsedTerm = _parse(inputTerm);
    if (parsedTerm.isFailure) {
      throw new Exception("Term Syntax Error");
    }
    return parsedTerm.value.toString();
  }
}