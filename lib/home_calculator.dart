import 'package:calculator2/data/calc_data.dart';
import 'package:calculator2/modules/calc_presenter.dart';
import 'package:calculator2/widgets/staggeredKeyPad.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements CalcDisplayViewContract {

  CalcDisplayViewPresenter _presenter;
  String _displayContent;

  _HomePageState() {
    // This is the view the presenter should use
    _presenter = new CalcDisplayViewPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    // Set the initial state for the display
    _presenter.proceedInput('CE');
  }

  @override
  Widget build(BuildContext context) {
    double _barHeihgt = 80.0;
    double _calcDisplayHeight = _barHeihgt;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ), // AppBar
      body: new Container(
        decoration: new BoxDecoration(color: Colors.black87),
        child: new Column(
          children: <Widget>[
            //Display column
            new Container(
              height: _calcDisplayHeight,
              decoration: new BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              alignment: Alignment.centerRight,
              child: new Text(
                '$_displayContent',
                style: _textStyle,
              ),
            ),
            //KeyPad column
            new KeyPad(_presenter),
          ], // Children of outer Row
        ), // Outer Row
      ),
    ); // Scaffold
  }

  @override
  void onSetCalcDisplay(DisplayContent content) {
    setState(() => _displayContent = content.displayText);
    print(_displayContent);
  }
}

TextStyle _textStyle = new TextStyle(
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18.0,
  height: 2.0,
);

