import 'package:calculator2/dependency_injection.dart';
import 'package:calculator2/home_calculator.dart';
import 'package:flutter/material.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}



