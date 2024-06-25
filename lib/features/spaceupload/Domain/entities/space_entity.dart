import 'package:equatable/equatable.dart';

class SpaceEntity extends Equatable {
  const SpaceEntity({this.message});
  final String? message;

  @override
  List<Object?> get props => [message];
}
