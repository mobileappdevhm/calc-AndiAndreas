import 'package:calculator2/data/calc_data.dart';

class ProdCalcData implements CalcData {
  String displayText = "0.0";

  ProdCalcData();

  @override
  DisplayContent fetchCalcResult() {
    //throw new calcResultException("Invalid input!");
    return new DisplayContent("0.0");
  }

  @override
  DisplayContent fetchCalcText() {
    return new DisplayContent(displayText);
  }

  @override
  void setDisplayText(String text) {
    displayText = text;
  }
}