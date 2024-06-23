import 'package:dartz/dartz.dart';
import 'package:space/common/datasource/datasource.dart';
import 'package:space/common/utils/exceptions.dart';
import 'package:space/features/signup/Domain/entities/signup_user_entity.dart';
import 'package:space/features/signup/Domain/repository/signup_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  @override
  Future<Either<String, SignUpUserEntity>> signUpUser(
      {required Map<String, dynamic> signUpData}) async {
    try {
      final signUpUser = await SpaceAppRequestsImplementation()
          .signUpUser(userData: signUpData);
      return right(signUpUser);
    } on RequestException catch (e) {
      return left(e.message);
    } on NetworkException catch (e) {
      return left(e.message);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return left('An unknown error occurred. Try again later');
    }
  }
}
