import 'package:calorie_calculator/screens/home_screen.dart';
import 'package:calorie_calculator/screens/login_screen.dart';
import 'package:calorie_calculator/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// entrance to app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _checkIfUser() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: FirebaseAuth.instance.onAuthStateChanged,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFF2DAFC5)),
        debugShowCheckedModeBanner: false,
        title: "Calorie Counter",
        home: _checkIfUser(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
  }
}
