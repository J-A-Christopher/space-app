import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space/features/signup/Domain/entities/signup_user_entity.dart';
import 'package:space/features/signup/Domain/usecases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUpUser>((event, emit) async {
      emit(SignUpLoading());
      final signUpUseCase =
          await SignUpUseCase().signUpUseCase(signUpData: event.userSignUpData);

      signUpUseCase.fold((failure) => emit(SignUpError(errorMessage: failure)),
          (signUpResponse) => emit(SignUpLoaded(userResponse: signUpResponse)));
    });
  }
}
