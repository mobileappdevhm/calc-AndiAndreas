// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator2/main.dart';

void main() {
  final Finder button0 = find.byKey(new Key("InkWell0"));
  final Finder button1 = find.byKey(new Key("InkWell1"));
  final Finder button2 = find.byKey(new Key("InkWell2"));
  final Finder button3 = find.byKey(new Key("InkWell3"));
  final Finder button4 = find.byKey(new Key("InkWell4"));
  final Finder button5 = find.byKey(new Key("InkWell5"));
  final Finder button6 = find.byKey(new Key("InkWell6"));
  final Finder button7 = find.byKey(new Key("InkWell7"));
  final Finder button8 = find.byKey(new Key("InkWell8"));
  final Finder button9 = find.byKey(new Key("InkWell9"));
  final Finder buttonCE = find.byKey(new Key("InkWellCE"));
  final Finder buttonC = find.byKey(new Key("InkWellC"));
  final Finder buttonDel = find.byKey(new Key("InkWell\u232B"));
  final Finder buttonMult = find.byKey(new Key("InkWell*"));
  final Finder buttonDiv = find.byKey(new Key("InkWell/"));
  final Finder buttonAdd = find.byKey(new Key("InkWell+"));
  final Finder buttonSub = find.byKey(new Key("InkWell-"));
  final Finder buttonResult = find.byKey(new Key("InkWell="));
  final Finder buttonPoint = find.byKey(new Key("InkWell."));
  final Finder resultDisplay = find.byKey(new Key("resultDisplayText"));
  
  String _getTextOfDisplay() {
    //Ugly but I haven't found any better way
    return resultDisplay.evaluate().toString().split('"').getRange(1, 2).first;
  }
  
  testWidgets('Check availabiliry of Numbers and Symbols on screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);
    expect(find.text('\u232B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('CE'), findsOneWidget);
    expect(find.text('.'), findsOneWidget);
    expect(find.text('*'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
  });

  testWidgets('Test Add calculation', (WidgetTester tester) async {
    // Try to calculate 67890 + 12345
    await tester.pumpWidget(new MyApp());
    await tester.tap(button6);
    await tester.tap(button7);
    await tester.tap(button8);
    await tester.tap(button9);
    await tester.tap(button0);
    await tester.tap(buttonAdd);
    await tester.tap(button1);
    await tester.tap(button2);
    await tester.tap(button3);
    await tester.tap(button4);
    await tester.tap(button5);
    await tester.tap(buttonResult);
    
    await tester.pump();
    expect(_getTextOfDisplay(), "80235");
  });

  testWidgets('Test Sub calculation', (WidgetTester tester) async {
    // Try to calculate 67890 - 12345
    await tester.pumpWidget(new MyApp());
    await tester.tap(button6);
    await tester.tap(button7);
    await tester.tap(button8);
    await tester.tap(button9);
    await tester.tap(button0);
    await tester.tap(buttonSub);
    await tester.tap(button1);
    await tester.tap(button2);
    await tester.tap(button3);
    await tester.tap(button4);
    await tester.tap(button5);
    await tester.tap(buttonResult);

    await tester.pump();
    expect(_getTextOfDisplay(), "55545");
  });

  testWidgets('Test Mult calculation', (WidgetTester tester) async {
    // Try to calculate 67890 * 12345
    await tester.pumpWidget(new MyApp());
    await tester.tap(button6);
    await tester.tap(button7);
    await tester.tap(button8);
    await tester.tap(button9);
    await tester.tap(button0);
    await tester.tap(buttonMult);
    await tester.tap(button1);
    await tester.tap(button2);
    await tester.tap(button3);
    await tester.tap(button4);
    await tester.tap(button5);
    await tester.tap(buttonResult);

    await tester.pump();
    expect(_getTextOfDisplay(), "838102050");
  });

  testWidgets('Test Div calculation', (WidgetTester tester) async {
    // Try to calculate 75 / 5
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(button5);
    await tester.tap(buttonDiv);
    await tester.tap(button5);
    await tester.tap(buttonResult);

    await tester.pump();
    expect(_getTextOfDisplay(), "15");
  });

  testWidgets('Test Button CE on result', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(buttonResult);
    await tester.pump();
    expect(_getTextOfDisplay(), "7");
    await tester.tap(buttonCE);
    await tester.pump();
    expect(_getTextOfDisplay(), "0");
  });

  testWidgets('Test Button CE on non result', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.pump();
    expect(_getTextOfDisplay(), "7");
    await tester.tap(buttonCE);
    await tester.pump();
    expect(_getTextOfDisplay(), "0");
  });

  testWidgets('Test Button C on result', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(button7);
    await tester.pump();
    expect(_getTextOfDisplay(), "77");
    await tester.tap(buttonC);
    await tester.pump();
    expect(_getTextOfDisplay(), "0");
  });

  testWidgets('Test Button C on non result', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(button7);
    await tester.tap(buttonResult);
    await tester.pump();
    expect(_getTextOfDisplay(), "77");
    await tester.tap(buttonC);
    await tester.pump();
    expect(_getTextOfDisplay(), "0");
  });

  testWidgets('Test Button C on operator', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(buttonSub);
    await tester.tap(buttonC);
    await tester.pump();
    expect(_getTextOfDisplay(), "7");
  });

  testWidgets('Test Button Del on number', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(button7);
    await tester.pump();
    expect(_getTextOfDisplay(), "77");
    await tester.tap(buttonDel);
    await tester.pump();
    expect(_getTextOfDisplay(), "7");
  });

  testWidgets('Test Button Del on operator', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.tap(button7);
    await tester.tap(buttonMult);
    await tester.pump();
    expect(_getTextOfDisplay(), "7 *");
    await tester.tap(buttonDel);
    await tester.pump();
    expect(_getTextOfDisplay(), "7");
  });
}
