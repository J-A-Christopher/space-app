part of 'post_space_bloc.dart';

abstract class PostSpaceState extends Equatable {
  const PostSpaceState();

  @override
  List<Object> get props => [];
}

class PostSpaceInitial extends PostSpaceState {}

class PostSpaceLoading extends PostSpaceState {}

class PostSpaceLoaded extends PostSpaceState {
  const PostSpaceLoaded({required this.message});
  final String message;
}

class PostSpaceError extends PostSpaceState {
  const PostSpaceError({required this.errorMessage});
  final String errorMessage;
}
