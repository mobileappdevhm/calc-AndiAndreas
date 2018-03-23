import 'package:calculator2/data/calc_data.dart';
import 'package:calculator2/dependency_injection.dart';

abstract class CalcDisplayViewContract {
  void onSetCalcDisplay(DisplayContent data);
}

class CalcDisplayViewPresenter {
  CalcDisplayViewContract _view;
  CalcData _displayData;

  CalcDisplayViewPresenter(this._view) {
    _displayData = new Injector().calcDisplayData;
  }

  void setDisplayData(String text){
    _displayData.setDisplayText(text);
  }
}