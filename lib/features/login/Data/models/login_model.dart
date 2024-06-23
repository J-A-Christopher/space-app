class LoginModel {
  LoginModel({this.password, this.username});
  final String? username;
  final String? password;

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
