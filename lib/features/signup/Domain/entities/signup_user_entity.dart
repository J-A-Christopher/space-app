import 'package:equatable/equatable.dart';

class SignUpUserEntity extends Equatable {
  const SignUpUserEntity({this.message, this.username});
  final String? message;
  final String? username;

  @override
  List<Object?> get props => [message, username];
}
