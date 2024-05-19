import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_model.dart'; // Import the ImageModel class

class ImagePickerProvider extends ChangeNotifier {
  ImageModel? _selectedImage;

  ImageModel? get selectedImage => _selectedImage;

  void pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage = ImageModel.fromXFile(pickedFile);
      notifyListeners();
    }
  }
}
