import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

// Events
abstract class ImageEvent {}

class PickImageEvent extends ImageEvent {
  final ImageSource source;

  PickImageEvent(this.source);
}

// States
abstract class ImageState {}

class PickedImageState extends ImageState {
  final String? imagePath;

  PickedImageState(this.imagePath);
}

// BLoC
class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(PickedImageState(null));

  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is PickImageEvent) {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: event.source);
      if (pickedFile != null) {
        yield PickedImageState(pickedFile.path);
      }
    }
  }
}
