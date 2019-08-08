import 'package:flutter/material.dart';

class WeightIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeightIndicatorState();
  }
}

class WeightIndicatorState extends State<WeightIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.arrow_downward,
          size: 20,
          color: Colors.green,
        ),
        Text(
          '10 lbs',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
