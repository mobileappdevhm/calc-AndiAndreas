import 'package:calculator2/data/calc_data.dart';

class ProdCalcData implements CalcData {
  String _displayText = "0.0";
  bool _isResult = true;

  ProdCalcData();

  @override
  DisplayContent fetchCalcData() {
    return new DisplayContent(_displayText, _isResult);
  }

  @override
  void setDisplayText(String text) {
    _displayText = text;
  }

  @override
  void setIsResult(bool isResult) {
    _isResult = isResult;
  }
}