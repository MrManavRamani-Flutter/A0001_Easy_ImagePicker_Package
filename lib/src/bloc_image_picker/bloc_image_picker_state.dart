import 'package:equatable/equatable.dart';

import '../models/image_model.dart';

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
