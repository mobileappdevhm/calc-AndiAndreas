class DisplayContent {
  String displayText;
  bool isResult;

  DisplayContent(this.displayText, this.isResult);
}

abstract class CalcData {
  DisplayContent fetchCalcData();
  void setDisplayText(String text);
  void setIsResult(bool isResult);
}

class CalcResultException implements Exception {
  final _message;

  CalcResultException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}