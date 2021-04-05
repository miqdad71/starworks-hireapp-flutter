class User {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String company;
  final String position;
  final String password;
  final String passwordConfirmation;

  User({
  this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.company,
    this.position,
    this.password,
    this.passwordConfirmation
});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      company: json['company'],
      position: json['position'],
      password: json['password'],
      passwordConfirmation: json['passwordConfirmation'],

    );
  }
}