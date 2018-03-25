import 'package:calculator2/modules/calc_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
];

class KeyPad extends StatelessWidget {

  CalcDisplayViewPresenter _presenter;

  KeyPad(this._presenter);

  @override
  Widget build(BuildContext context) {
    final Orientation _orientation = MediaQuery.of(context).orientation;
    final bool _isLandscape = _orientation == Orientation.landscape;

    double _mainAxisSpacing = 0.0;
    //if (!_isLandscape) {
    //  _mainAxisSpacing = (_heihgt - _width) / 5.0;
    //}

    int _crossAxisCount = 8;
    if (!_isLandscape) {
      _crossAxisCount = 4;
    }

    return new Expanded(
      child: new Container(
        child: new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new StaggeredGridView.count(
              crossAxisCount: _crossAxisCount,
              staggeredTiles: _staggeredTiles,
              children: getTiles(),
              mainAxisSpacing: _mainAxisSpacing,
              //crossAxisSpacing: 0.0,
              padding: const EdgeInsets.all(0.0),
            )),
      ),
    );
  }

  List<Widget> getTiles() {
    return <Widget>[
      //This code below may not be the best way to go. It is not possible to pass an predefined textStyle as const. And this solution gives a good flexibility.
      //1. Row of tiles CE, C, <=, /
      new _keyPadTile("CE", _presenter),
      new _keyPadTile("C", _presenter),
      new _keyPadTile("\u232B", _presenter),
      new _keyPadTile("\u00F7", _presenter),
      //2. Row of tiles 7, 8, 9, *
      new _keyPadTile("7", _presenter),
      new _keyPadTile("8", _presenter),
      new _keyPadTile("9", _presenter),
      new _keyPadTile("*", _presenter),
      //3. Row of tiles 4, 5, 6, -
      new _keyPadTile("4", _presenter),
      new _keyPadTile("5", _presenter),
      new _keyPadTile("6", _presenter),
      new _keyPadTile("-", _presenter),
      //4. Row of tiles 1, 2, 3, +
      new _keyPadTile("1", _presenter),
      new _keyPadTile("2", _presenter),
      new _keyPadTile("3", _presenter),
      new _keyPadTile("+", _presenter),
      //5. Row of tiles empty, 0, ., =
      new _keyPadTile("", _presenter),
      new _keyPadTile("0", _presenter),
      new _keyPadTile(".", _presenter),
      new _keyPadTile("=", _presenter),
    ];
  }
}

class _keyPadTile extends StatelessWidget {
  const _keyPadTile(this._theText, this._presenter);

  final CalcDisplayViewPresenter _presenter;
  final String _theText;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {_presenter.proceedInput(_theText);},
      child: new Center(
        child: new Padding(
            padding: const EdgeInsets.all(0.0),
            child: new Text(
              _theText,
              style: const TextStyle(fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  color: Colors.white),
            )
        ),
      ),
    );
  }
}