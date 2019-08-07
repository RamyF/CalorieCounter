import 'package:calorie_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/pie_chart.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    const double pi = 3.1416;


    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text('Daily Summary', style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        Text('08/07/2019', style: TextStyle(color: Colors.white),),
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
        Row(children: <Widget>[
          Icon(Icons.arrow_downward, size: 20, color: Colors.green,),
          Text('10 lbs', style: TextStyle(color: Colors.white),)
        ],),
        Container(
          height: (deviceHeight * .2),
          width: deviceWidth,
          child: Card(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("2400", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("GOAL", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.remove, size: 30, color: Colors.white,),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("2100", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("FOOD", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Transform.rotate(angle: (pi / 2), child: Icon(Icons.pause, color: Colors.white,),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("300", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("REMAINING", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ],),
            ),
          ),
        ),
      ],
    );
  }
}
