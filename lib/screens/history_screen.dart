import 'package:calorie_calculator/services/auth_service.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {

  static final String id = 'history_screen';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: FlatButton(
        onPressed: () => AuthService.logout(),
        child: Text("Logout"),
      ),),
    );
  }
}