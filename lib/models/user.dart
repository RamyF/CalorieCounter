
class User{
  String name, email, profileImageURL;
  // both arrays hold 30 nums
  List monthlyCals;
  List monthlyWeights;

  User(
      {this.name,
      this.email,
      this.profileImageURL,
      this.monthlyCals,
      this.monthlyWeights});

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      email: data['email'],
      profileImageURL: data['profileImageUrl'],
      monthlyCals: data['monthlyCals'],
      monthlyWeights: data['monthlyWeights'],
    );
    
  }
}
