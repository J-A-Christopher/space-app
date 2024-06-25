import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:space/common/datasource/datasource.dart';
import 'package:space/common/utils/exceptions.dart';
import 'package:space/features/spaceupload/Domain/entities/space_entity.dart';
import 'package:space/features/spaceupload/Domain/repository/domain_repository.dart';

class SpaceBooker implements SpaceRegistration {
  @override
  Future<Either<String, SpaceEntity>> registerSpace(
      {required File imageFile,
      required String name,
      required String description,
      required List<File> spaceImages}) async {
    try {
      final registerSpace = await SpaceAppRequestsImplementation()
          .uploadImageAndData(
              description: description,
              imageFile: imageFile,
              name: name,
              spaceImages: spaceImages);
      

      return right(registerSpace);
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
