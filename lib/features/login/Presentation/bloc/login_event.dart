part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnUserLogin extends LoginEvent {
  const OnUserLogin({required this.userLoginData});
  final Map<String, dynamic> userLoginData;
}
