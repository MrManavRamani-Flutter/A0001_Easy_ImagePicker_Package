import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class ImageRepository {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      return pickedFile;
    } catch (e) {
      // Handle error
      log('Error picking image: $e');
      return null;
    }
  }
}
