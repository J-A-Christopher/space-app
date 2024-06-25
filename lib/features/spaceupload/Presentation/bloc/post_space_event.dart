part of 'post_space_bloc.dart';

abstract class PostSpaceEvent extends Equatable {
  const PostSpaceEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterSpace extends PostSpaceEvent {
  const OnRegisterSpace(
      {required this.imageFile,
      required this.spaceDesc,
      required this.spaceName,
      required this.spaceImages});
  final String spaceName;
  final String spaceDesc;
  final File imageFile;
  final List<File> spaceImages;
}
