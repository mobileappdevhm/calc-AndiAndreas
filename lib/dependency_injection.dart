import 'package:calculator2/data/calc_data.dart';
//import 'package:calculator2/data/calc_data_mock';
import 'package:calculator2/data/calc_data_prod.dart';

enum Flavor {
  MOCK,
  PROD
}

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CalcData get calcDisplayData {
    switch (_flavor) {
      //case Flavor.MOCK:
      //  return new MockCalcData();
      default:
        return new ProdCalcData();
    }
  }
}