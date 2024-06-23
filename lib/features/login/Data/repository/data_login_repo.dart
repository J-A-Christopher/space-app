import 'package:dartz/dartz.dart';
import 'package:space/common/datasource/datasource.dart';
import 'package:space/common/utils/exceptions.dart';
import 'package:space/features/login/Domain/entity/login_entity.dart';
import 'package:space/features/login/Domain/repository/login_repo.dart';

class DataLoginRepo implements DomainLoginRepo {
  @override
  Future<Either<String, LoginEntity>> signInUser(
      {required Map<String, dynamic> signInData}) async {
    try {
      final signInUser = await SpaceAppRequestsImplementation()
          .loginUser(loginData: signInData);

      return right(signInUser);
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
