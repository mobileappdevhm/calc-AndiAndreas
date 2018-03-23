import 'package:calculator2/data/calc_data.dart';
import 'package:calculator2/modules/calc_presenter.dart';
import 'package:calculator2/widgets/staggeredKeyPad.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    implements CalcDisplayViewContract {
  CalcDisplayViewPresenter _presenter;
  DisplayContent _displayContent;

  _HomePageState() {
    // This is the view the presenter should use
    _presenter = new CalcDisplayViewPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    // Set the initial state for the display
    _presenter.setDisplayData("0.0");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Calculator"),
        ), // AppBar
        body: new Example01(),

        /*new Container(
          decoration: new BoxDecoration(color: Colors.black87),
          child: new Column(
            children: <Widget>[

              //Display column
              new Container(
                height: 90.0,
                decoration: new BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 15.0),
                alignment: Alignment.centerRight,
                child: new Text(
                  '00000',
                  style: textStyle,
                ),
              ),
              //KeyPad column


            ], // Children of outer Row
          ), // Outer Row
        ),*/
    ); // Scaffold
  }

  @override
  void onSetCalcDisplay(DisplayContent data) {
    // TODO: implement onSetCalcDisplay
  }
}

TextStyle textStyle = new TextStyle(
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18.0,
  height: 2.0,
);

