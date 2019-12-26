class User {
  String id, userName, profileImageURL;
  int dailyCalGoal;
  double startingWeight, currentWeight, goalWeight;
  bool isLosingWeight;
  var weights = List(30);
  var dailyCalTotals = List(30);
}