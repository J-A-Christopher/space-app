import 'package:equatable/equatable.dart';
import 'package:space/features/signup/Domain/entities/signup_user_entity.dart';

class SignUpDataResponse extends SignUpUserEntity with EquatableMixin {
  SignUpDataResponse({this.message, this.username});
  final String? message;
  final String? username;

  factory SignUpDataResponse.fromJson(Map<String, dynamic> data) {
    return SignUpDataResponse(
        message: data['message'], username: data['data']['username']);
  }
}
