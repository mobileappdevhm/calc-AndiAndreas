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