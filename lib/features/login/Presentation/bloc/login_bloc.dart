import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space/features/login/Domain/entity/login_entity.dart';
import 'package:space/features/login/Domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<OnUserLogin>((event, emit) async {
      emit(LoginLoading());
      final signInUseCase =
          await LoginUseCase().signInUseCase(signInData: event.userLoginData);

      signInUseCase.fold((failure) => emit(LoginInError(message: failure)),
          (signInResponse) => emit(LoginLoaded(loginUserData: signInResponse)));
    });
  }
}
