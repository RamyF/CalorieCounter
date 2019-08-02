import 'package:calorie_calculator/views/view_selection.dart';
import 'package:flutter/material.dart';

// entrance to app
void main() => runApp(MyApp());

// custom primary color
Map<int, Color> customColor = {
  50:Color.fromRGBO(60, 105, 151, .1),
  100:Color.fromRGBO(60, 105, 151, .2),
  200:Color.fromRGBO(60, 105, 151, .3),
  300:Color.fromRGBO(60, 105, 151, .4),
  400:Color.fromRGBO(60, 105, 151, .5),
  500:Color.fromRGBO(60, 105, 151, .6),
  600:Color.fromRGBO(60, 105, 151, .7),
  700:Color.fromRGBO(60, 105, 151, .8),
  800:Color.fromRGBO(60, 105, 151, .9),
  900:Color.fromRGBO(60, 105, 151, 1),
};

MaterialColor primaryColor = MaterialColor(0xFF3c6997, customColor);
Color secondaryColor = Color(0xFF203851);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calorie Counter",
      theme: ThemeData(
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: secondaryColor,
      ),
      home: ViewSelection()
    );
  }
}

