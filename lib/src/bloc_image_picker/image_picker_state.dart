import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class ImagePickerState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerLoading extends ImagePickerState {}

class ImagePickerLoaded extends ImagePickerState {
  final File image;

  ImagePickerLoaded(this.image);

  @override
  List<Object> get props => [image];
}

class ImagePickerError extends ImagePickerState {
  final String message;

  ImagePickerError(this.message);

  @override
  List<Object> get props => [message];
}
