import 'package:calorie_calculator/models/user.dart';
import 'package:calorie_calculator/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  static final String id = 'overview_screen';

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    print(user);


    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Center(
            child: FlatButton(
              onPressed: () => AuthService.logout(),
              child: Text(
                "Logout",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
