import 'package:dartz/dartz.dart';
import 'package:space/features/login/Domain/entity/login_entity.dart';

abstract class DomainLoginRepo{
  Future<Either<String, LoginEntity>> signInUser(
      {required Map<String, dynamic> signInData});
}