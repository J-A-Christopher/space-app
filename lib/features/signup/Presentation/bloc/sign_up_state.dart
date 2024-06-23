part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpLoaded extends SignUpState {
 const  SignUpLoaded({required this.userResponse});
  final SignUpUserEntity userResponse;
}

final class SignUpError extends SignUpState {
  const SignUpError({required this.errorMessage});
  final String errorMessage;
}
