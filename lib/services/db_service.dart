import 'package:calorie_calculator/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{
  final Firestore _db = Firestore.instance;


  // fetch user data from Firestore
  // TODO figure out why stream is not creating user objects.
  Stream<User> userStream(String id) {
    return _db.collection('users').document(id).snapshots().map((snap) => User.fromMap(snap.data));
  }

}