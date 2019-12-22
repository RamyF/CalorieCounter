import 'package:calorie_calculator/services/auth_service.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {

  static final String id = 'overview_screen';

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: FlatButton(
        onPressed: () => AuthService.logout(),
        child: Text("Logout"),
      ),),
    );
  }
}