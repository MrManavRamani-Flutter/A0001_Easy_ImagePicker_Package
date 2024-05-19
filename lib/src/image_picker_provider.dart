import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../a0001_easy_image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  ImageModel? _selectedImage;

  ImageModel? get selectedImage => _selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage = ImageModel.fromXFile(pickedFile);
      notifyListeners(); // Notify listeners when the image is picked
    }
  }

  //add takeImage
  Future<void> takeImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _selectedImage = ImageModel.fromXFile(pickedFile);
      notifyListeners(); // Notify listeners when the image is picked
    }
  }
}
