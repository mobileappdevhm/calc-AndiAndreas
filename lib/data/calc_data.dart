class DisplayContent {
  String displayText;

  DisplayContent(this.displayText);
}

abstract class CalcData {
  DisplayContent fetchCalcResult();
  DisplayContent fetchCalcText();
  void setDisplayText(String text);
}

class CalcResultException implements Exception {
  final _message;

  CalcResultException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}