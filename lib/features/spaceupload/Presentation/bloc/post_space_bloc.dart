import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space/features/spaceupload/Domain/usecases/space_usecase.dart';

part 'post_space_event.dart';
part 'post_space_state.dart';

class PostSpaceBloc extends Bloc<PostSpaceEvent, PostSpaceState> {
  PostSpaceBloc() : super(PostSpaceInitial()) {
    on<OnRegisterSpace>((event, emit) async {
      emit(PostSpaceLoading());
      final spaceUseCase = await SpaceUseCase().spaceBookingUseCase(
          imageFile: event.imageFile,
          name: event.spaceName,
          description: event.spaceDesc,
          spaceImages: event.spaceImages);

      spaceUseCase.fold(
          (failure) => emit(PostSpaceError(errorMessage: failure)),
          (spaceResponse) =>
              emit(PostSpaceLoaded(message: spaceResponse.message ?? '')));
    });
  }
}
