part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
 const LoginLoaded({required this.loginUserData});
  final LoginEntity loginUserData;
}

final class LoginInError extends LoginState {
  const LoginInError({required this.message});
  final String message;
}
