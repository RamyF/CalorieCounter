import 'package:calorie_calculator/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{
  final Firestore _db = Firestore.instance;


  // fetch user data from Firestore
  Stream<User> userStream(String id) {
    return _db.collection('users').document(id).snapshots().map((snapshot) => User.fromMap(snapshot.data));
  }

}