import 'package:flutter/material.dart';
import '../../main.dart';

class HomeCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeCardState();
  }
}

class _HomeCardState extends State<HomeCard> {
  final double pi = 3.1416;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "2400",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "GOAL",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "2100",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "FOOD",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Transform.rotate(
                  angle: (pi / 2),
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "300",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "REMAINING",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
