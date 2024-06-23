import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
   const LoginEntity({this.email, this.message, this.token, this.username});
  final String? message;
  final String? username;
  final String? token;
  final String? email;
  
  @override
  
  List<Object?> get props => [message, username,token, email];
}