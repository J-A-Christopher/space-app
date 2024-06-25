import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:space/features/spaceupload/Domain/entities/space_entity.dart';

abstract class SpaceRegistration{
 Future<Either<String, SpaceEntity>> registerSpace(
     {required File imageFile,required String name, required String description,required List<File> spaceImages});
}