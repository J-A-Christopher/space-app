part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class OnSignUpUser extends SignUpEvent {
  const OnSignUpUser({required this.userSignUpData});
  final Map<String, dynamic> userSignUpData;
}
