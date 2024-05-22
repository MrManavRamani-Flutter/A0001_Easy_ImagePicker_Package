import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePicker _imagePicker = ImagePicker();

  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<PickImageEvent>(_onPickImage);
  }

  Future<void> _onPickImage(
      PickImageEvent event, Emitter<ImagePickerState> emit) async {
    emit(ImagePickerLoading());
    try {
      final pickedFile = await _imagePicker.pickImage(source: event.source);
      if (pickedFile != null) {
        emit(ImagePickerLoaded(File(pickedFile.path)));
        Fluttertoast.showToast(
            msg: "image selected",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.green);
      } else {
        emit(ImagePickerError("No image selected"));
        Fluttertoast.showToast(
            msg: "No image selected",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      emit(ImagePickerError(e.toString()));
      Fluttertoast.showToast(
          msg: "Error: ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.orangeAccent);
    }
  }
}
