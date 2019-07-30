import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {

  List<charts.Series<Calories, String>> _seriesPieData;




  _generateData() {
    // dummy data for chart
    var pieData = [
      Calories('Consumed', 2100, Colors.lightBlue),
      Calories('Left', 300, Colors.red),
    ];

    // pie data added to series
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Calories calories, _) => calories.name,
        measureFn: (Calories calories, _) => calories.value,
        colorFn: (Calories calories, _) => charts.ColorUtil.fromDartColor(calories.colorValue),
        id: 'Calorie Balance',
        labelAccessorFn: (Calories row, _)=>'${row.value} cals',
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
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Daily Caloric Intake', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                Expanded(
                  child: charts.PieChart(
                    _seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    defaultRenderer: charts.ArcRendererConfig(
                      arcWidth: 75,
                      arcRendererDecorators: [
                        charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.outside)
                      ]),
                  )
                ),
              ],),
          ),
        ),
      );
    }
}














class Calories{
  String name;
  int value;
  Color colorValue;

  Calories(this.name, this.value, this.colorValue);
}
