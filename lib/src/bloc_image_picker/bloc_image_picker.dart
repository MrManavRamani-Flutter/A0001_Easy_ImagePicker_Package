import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../models/image_model.dart';
import './bloc_image_picker_event.dart';
import './bloc_image_picker_state.dart';

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
