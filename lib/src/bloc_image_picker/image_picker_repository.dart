// lib/src/bloc_image_picker/image_picker_repository.dart

import 'package:image_picker/image_picker.dart';

class ImageRepository {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      return pickedFile;
    } catch (e) {
      // Handle error
      print('Error picking image: $e');
      return null;
    }
  }
}
