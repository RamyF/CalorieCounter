import 'package:calorie_calculator/views/view_selection.dart';
import 'package:flutter/material.dart';

// entrance to app
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calorie Counter",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: ViewSelection()
    );
  }
}

