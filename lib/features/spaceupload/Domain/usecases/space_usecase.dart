import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:space/features/spaceupload/Data/repository/space_booker.dart';
import 'package:space/features/spaceupload/Domain/entities/space_entity.dart';

class SpaceUseCase {
  Future<Either<String, SpaceEntity>> spaceBookingUseCase(
      {required File imageFile,
      required String name,
      required String description,
      required List<File> spaceImages}) async {
    final spaceReg = await SpaceBooker().registerSpace(
        imageFile: imageFile,
        name: name,
        description: description,
        spaceImages: spaceImages);
    
    return spaceReg;
  }
}
