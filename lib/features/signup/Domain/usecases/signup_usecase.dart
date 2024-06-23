import 'package:dartz/dartz.dart';
import 'package:space/features/signup/Data/repositories/signup_data.dart';
import 'package:space/features/signup/Domain/entities/signup_user_entity.dart';

class SignUpUseCase {
  Future<Either<String, SignUpUserEntity>> signUpUseCase(
      {required Map<String, dynamic> signUpData}) async {
    final signUpUser =
        await SignUpDataRepo().signUpUser(signUpData: signUpData);
    return signUpUser;
  }
}
