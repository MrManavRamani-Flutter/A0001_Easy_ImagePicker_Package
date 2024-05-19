import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'image_model.dart';

// Event
abstract class ImagePickerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickImageEvent extends ImagePickerEvent {
  final ImageSource source;

  PickImageEvent(this.source);

  @override
  List<Object?> get props => [source];
}

// State
abstract class ImagePickerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageInitial extends ImagePickerState {}

class ImagePicked extends ImagePickerState {
  final ImageModel imageModel;

  ImagePicked(this.imageModel);

  @override
  List<Object?> get props => [imageModel];
}

// BLoC
class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImageInitial());

  Stream<ImagePickerState> mapEventToState(ImagePickerEvent event) async* {
    if (event is PickImageEvent) {
      final pickedFile = await ImagePicker().pickImage(source: event.source);

      if (pickedFile != null) {
        yield ImagePicked(ImageModel.fromXFile(pickedFile));
      }
    }
  }
}
