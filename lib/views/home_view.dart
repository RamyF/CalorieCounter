import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/homeView_widgets/pie_chart.dart';
import '../widgets/homeView_widgets/calories_card.dart';
import '../widgets/homeView_widgets/weight_indicator.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  final String currentDate = DateFormat("dd/MM/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text('Daily Summary',
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        Text(
          currentDate,
          style: TextStyle(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (deviceHeight * .40),
              child: PieChart(),
            ),
          ),
        ),
        WeightIndicator(),
        HomeCard(),
      ],
    );
  }
}
