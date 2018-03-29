import 'package:calculator2/data/calc_data.dart';
import 'package:calculator2/dependency_injection.dart';
import 'package:calculator2/utils/mathParse.dart';

abstract class CalcDisplayViewContract {
  void onSetCalcDisplay(DisplayContent input);
}

class CalcDisplayViewPresenter {
  final List<String> _numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];
  final List<String> _operators = ['+', '-', '*', '/'];

  CalcDisplayViewContract _view;
  CalcData _displayData;

  CalcDisplayViewPresenter(this._view) {
    _displayData = new Injector().calcDisplayData;
  }

  void proceedInput(String input) {
    final DisplayContent currentData = _displayData.fetchCalcData();
    String result = "";

    // Normal number: Just add it to the data
    if (_numbers.contains(input)) {
      // Replace results
      result = _proceedNumber(currentData, input);
      // Operator: Just add it to the data with spacing for a better look
    } else if (_operators.contains(input)) {
      result = _proceedOperator(currentData, input);
      // Special Characters:
    } else {
      if (input == "CE") {
        result = _proceedCE();
      }
      else if (input == "C") {
        result = _proceedC(currentData);
      }
      else if (input == "\u232B") {
        result = _proceedDel(currentData);
      }
      else if (input == "=") {
        result = _calculateResult(currentData);
      }
    }

    _setDisplayData(result);
  }

  String _calculateResult(DisplayContent currentData) {
    _displayData.setIsResult(true);
    return MathParse.calculate(currentData.displayText);
  }

  String _proceedDel(DisplayContent currentData) {
    final String currentText = currentData.displayText;
    String result = currentText.substring(0, currentText.length - 1);
    // Remove all spaces left
    while (result != "" && result.substring(result.length - 1) == " ") {
      result = result.substring(0, result.length - 1);
    }
    // Reset if new display text is empty
    if (result == "")
      return _proceedCE();
    return result;
  }

  String _proceedC(DisplayContent currentData) {
    // Split the current input and remove the last section
    final List<String> splitted = currentData.displayText.split(" ");
    // If there is only one number reset the display (perform CE)
    if (splitted.length <= 1)
      return _proceedCE();
    else {
      return splitted.getRange(0, splitted.length - 1).join(" ");
    }
  }

  String _proceedCE() {
    _displayData.setIsResult(true);
    return "0";
  }

  String _proceedOperator(DisplayContent currentData, String input) {
    _displayData.setIsResult(false);
    // Operators shouldn't override results
    // Only - is allowed after a operator any other must follow a number
    if (_lastCharIsNumber(currentData.displayText) || input == "-")
      return currentData.displayText + " " + input;
    else
      return currentData.displayText;
  }

  String _proceedNumber(DisplayContent currentData, String input) {
    String result;
    // Replace result
    if (currentData.isResult)
      result = input;
    // Add a space if last input was an operator
    else if (_lastCharIsOperator(currentData.displayText))
      result = currentData.displayText + ' ' + input;
    else
      result = currentData.displayText + input;

    _displayData.setIsResult(false);
    return result;
  }

  bool _lastCharIsOperator(String string) {
    if (_operators.contains(string.substring(string.length - 1)))
      return true;
    else
      return false;
  }

  bool _lastCharIsNumber(String string) {
    if (_numbers.contains(string.substring(string.length - 1)))
      return true;
    else
      return false;
  }

  void _setDisplayData(String content) {
    _displayData.setDisplayText(content);
    _view.onSetCalcDisplay(_displayData.fetchCalcData());
  }
}