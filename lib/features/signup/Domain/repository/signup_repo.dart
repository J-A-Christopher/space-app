import 'package:dartz/dartz.dart';
import 'package:space/features/signup/Domain/entities/signup_user_entity.dart';

abstract class SignUpDomainRepo {
  Future<Either<String, SignUpUserEntity>> signUpUser(
      {required Map<String, dynamic> signUpData});
}
