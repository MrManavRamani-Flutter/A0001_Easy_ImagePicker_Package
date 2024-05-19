import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/image_model.dart';

class ImagePickerProvider extends ChangeNotifier {
  final ChangeNotifier _changeNotifier = ChangeNotifier();
  ImageModel? _imageModel;

  ImageModel? get imageModel => _imageModel;

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _imageModel = ImageModel.fromXFile(pickedFile);
      _changeNotifier.notifyListeners();
    }
  }

  // Required to expose the ChangeNotifier's notifyListeners method
  @override
  void notifyListeners() {
    _changeNotifier.notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../models/image_model.dart';
//
// class ImagePickerProvider extends ChangeNotifier {
//   ImageModel? _imageModel;
//
//   ImageModel? get imageModel => _imageModel;
//
//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//
//     if (pickedFile != null) {
//       _imageModel = ImageModel.fromXFile(pickedFile);
//       notifyListeners();
//     }
//   }
// }
