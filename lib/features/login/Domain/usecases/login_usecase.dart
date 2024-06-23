import 'package:dartz/dartz.dart';
import 'package:space/features/login/Data/repository/data_login_repo.dart';
import 'package:space/features/login/Domain/entity/login_entity.dart';

class LoginUseCase {
  Future<Either<String, LoginEntity>> signInUseCase(
      {required Map<String, dynamic> signInData}) async {
    final signUpUser = await DataLoginRepo().signInUser(signInData: signInData);
    return signUpUser;
  }
}
