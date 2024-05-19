import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_model.dart';

class ImagePickerProvider extends ChangeNotifier {
  ImageModel? _imageModel;

  ImageModel? get imageModel => _imageModel;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _imageModel = ImageModel.fromXFile(pickedFile);
      notifyListeners();
    }
  }
}
