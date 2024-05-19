import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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
