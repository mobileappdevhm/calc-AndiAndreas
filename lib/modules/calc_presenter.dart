import 'package:calculator2/data/calc_data.dart';
import 'package:calculator2/dependency_injection.dart';

abstract class CalcDisplayViewContract {
  void onSetCalcDisplay(DisplayContent input);
}

class CalcDisplayViewPresenter {
  CalcDisplayViewContract _view;
  CalcData _displayData;

  CalcDisplayViewPresenter(this._view) {
    _displayData = new Injector().calcDisplayData;
  }

  void proceedInput(String text){
    String currentInput = _displayData.fetchCalcText().displayText;
    setDisplayData(currentInput + text);
  }

  void setDisplayData(String content){
    _displayData.setDisplayText(content);
    _view.onSetCalcDisplay(_displayData.fetchCalcText());
  }
}