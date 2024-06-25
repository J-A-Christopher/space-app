import 'package:equatable/equatable.dart';
import 'package:space/features/spaceupload/Domain/entities/space_entity.dart';

class SpaceModel extends SpaceEntity with EquatableMixin {
  SpaceModel({this.message});
  final String? message;

  factory SpaceModel.fromJson(Map<String, dynamic> data) {
    return SpaceModel(message: data['message']);
  }
}
