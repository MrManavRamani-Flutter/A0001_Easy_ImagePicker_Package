import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'image_model.dart';

class ImagePickerController extends GetxController {
  var imageModel = Rx<ImageModel?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      imageModel.value = ImageModel.fromXFile(pickedFile);
    }
  }
}
