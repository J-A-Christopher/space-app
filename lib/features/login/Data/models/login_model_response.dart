import 'package:equatable/equatable.dart';
import 'package:space/features/login/Domain/entity/login_entity.dart';

class LoginResponse extends LoginEntity with EquatableMixin{
  LoginResponse({this.email, this.message, this.token, this.username});
  final String? message;
  final String? username;
  final String? token;
  final String? email;

  factory LoginResponse.fromJson(Map<String, dynamic> data) {
    return LoginResponse(
        email: data['data']['email'],
        message: data['message'],
        token: data['token'],
        username: data['data']['username']);
  }
}
