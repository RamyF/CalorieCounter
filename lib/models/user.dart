import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User{
  String name, email, profileImageURL;
  // both arrays hold 30 nums
  List<int> monthlyCals;
  List<double> monthlyWeights;

  User(
      {this.name,
      this.email,
      this.profileImageURL,
      this.monthlyCals,
      this.monthlyWeights});

  factory User.fromMap(Map data) {
    return User(
      name: data['name'],
      email: data['email'],
      profileImageURL: data['profileImageURL'],
      monthlyCals: data['monthlyCals'],
      monthlyWeights: data['monthlyWeights'],
    );
  }
}
