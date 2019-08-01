import 'package:flutter/material.dart';
import '../widgets/pie_chart.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text('Summary', style: TextStyle(fontSize: 30)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Align(
            alignment: Alignment.topCenter,
                child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (deviceHeight * .40),
              child: PieChart(),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 20,
            child: Center(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('2500'),
                      Text('Goal')
                    ],
                  ),
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}
