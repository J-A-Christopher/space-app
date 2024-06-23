class SignUpModel {
  SignUpModel({this.email, this.fullName, this.password, this.username});
  final String? username;
  final String? fullName;
  final String? email;
  final String? password;

  factory SignUpModel.fromJson(Map<String, dynamic> data) {
    return SignUpModel(
        email: data['email'],
        fullName: data['full_name'],
        password: data['password'],
        username: data['username']);
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'full_name': fullName,
      'password': password,
      'email': email
    };
  }
}
