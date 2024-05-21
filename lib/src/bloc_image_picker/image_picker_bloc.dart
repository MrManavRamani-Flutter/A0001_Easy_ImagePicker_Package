// lib/src/bloc/image_picker_bloc.dart

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc_image_picker/image_picker_repository.dart';
import '../bloc_image_picker/picked_image.dart';

abstract class ImageEvent {}

class PickImageEvent extends ImageEvent {
  final ImageSource source;

  PickImageEvent(this.source);
}

abstract class ImageState {}

class PickedImageState extends ImageState {
  final ImageModel image;

  PickedImageState(this.image);
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository;

  ImageBloc(this.imageRepository)
      : super(PickedImageState(ImageModel(pathString: '')));

  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is PickImageEvent) {
      final XFile? pickedFile = await imageRepository.pickImage(event.source);
      if (pickedFile != null) {
        yield PickedImageState(ImageModel.fromXFile(pickedFile));
      }
    }
  }
}
