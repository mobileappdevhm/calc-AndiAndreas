import 'package:calculator2/data/calc_data.dart';

class MockCalcData implements CalcData {
  String displayText = "0.0";

  MockCalcData();

  @override
  DisplayContent fetchCalcResult() {
    //throw new calcResultException("Invalid input!");
    return new DisplayContent("0.0");
  }

  @override
  DisplayContent fetchCalcText() {
    return new DisplayContent("0.0");
  }

  @override
  void setDisplayText(String text) {
    // TODO: implement setCalcText
  }
}