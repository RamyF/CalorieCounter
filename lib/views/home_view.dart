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
        Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 70.0),
          child: Align(
            alignment: Alignment.topCenter,
                child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (deviceHeight * .40),
              child: PieChart(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: (deviceHeight * .2),
            width: deviceWidth,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("2400", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("GOAL")
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.remove, size: 30,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("2100", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("FOOD")
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Transform.rotate(angle: (pi / 2), child: Icon(Icons.pause),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("300", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("REMAINING")
                      ],
                    ),
                  ],),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
