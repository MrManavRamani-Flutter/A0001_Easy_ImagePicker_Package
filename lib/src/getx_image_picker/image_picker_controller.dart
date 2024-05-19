// lib/image_picker_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'image_model.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rxn<ImageModel>();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage.value = ImageModel.fromXFile(image);
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }
}
