import 'package:calorie_calculator/services/auth_service.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {

  static final String id = 'account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: FlatButton(
        onPressed: () => AuthService.logout(),
        child: Text("Logout"),
      ),),
    );
  }
}