import 'package:calorie_calculator/models/user.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  static final String id = 'overview_screen';

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final Color cardColor = Color(0xFF00315F);
  Widget buildCalCard(User user) {
    return Container(
      height: 200.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20.0, top: 15.0, left: 5.0),
                  child: Text(
                    'Today\'s Calories',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                (user.currentCals > user.calGoal)
                    ? Text(
                        '${user.currentCals}',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    : Text(
                        '${user.currentCals}',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C6267)),
                      ),
                Text(
                  ' / ${user.calGoal}',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 25.0,
                    animationDuration: 1250,
                    percent: ((user.currentCals / user.calGoal) >= 1.0)
                        ? 1.0
                        : (user.currentCals / user.calGoal),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: ((user.currentCals / user.calGoal) <= 1.0)
                        ? Color(0xFF1C6267)
                        : Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
            child: buildCalCard(user),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5.0, right: 5.0),
            child: Card(
              color: cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
