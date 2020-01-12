import 'package:calorie_calculator/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  
  
  
  // signs up user with firebase auth and stores acct in firebase store
  static void signUpUser(BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'name': name,
          'email': email,
          'profileImageUrl': '',
        });
        
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  // logs out user from app
  static void logout () {
    _auth.signOut();
  }

  static void login (String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch (e) {
      print(e);
    }
    
  }


}