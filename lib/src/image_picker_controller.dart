// ./src/getx_image_picker/image_picker_controller.dart

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var selectedImagePath = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImagePath.value = image.path;
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }
}
