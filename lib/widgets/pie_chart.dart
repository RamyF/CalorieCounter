import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../main.dart';

class PieChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PieChartState();
  }
}

class PieChartState extends State<PieChart> {
  List<charts.Series<Calories, String>> _seriesPieData;

  _generateData() {
    // dummy data for chart
    var pieData = [
      Calories('Consumed', 2100, primaryColor),
      Calories('Left', 300, Colors.white),
    ];

    // pie data added to series
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Calories calories, _) => calories.name,
        measureFn: (Calories calories, _) => calories.value,
        colorFn: (Calories calories, _) =>
            charts.ColorUtil.fromDartColor(calories.colorValue),
        id: 'Calorie Balance',
        labelAccessorFn: (Calories row, _) => '${row.value} cals',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Calories, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: charts.PieChart(
            _seriesPieData,
            animate: true,
            animationDuration: Duration(seconds: 2),
            defaultRenderer: charts.ArcRendererConfig(
                arcWidth: 75,
                arcRendererDecorators: [
                  charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.outside,
                      outsideLabelStyleSpec: charts.TextStyleSpec(fontSize: 10,color: charts.MaterialPalette.white))
                ]),
          ),
        ),
      ],
    );
  }
}

class Calories {
  String name;
  int value;
  Color colorValue;

  Calories(this.name, this.value, this.colorValue);
}
