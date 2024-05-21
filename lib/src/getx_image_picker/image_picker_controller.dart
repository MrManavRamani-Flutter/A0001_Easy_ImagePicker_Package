// ./src/getx_image_picker/image_picker_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var selectedImagePath = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImagePath.value = image.path;
      Get.snackbar(
        'Success',
        'Image selected',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        icon: const Icon(Icons.check_circle, color: Colors.white),
        mainButton: TextButton(
          onPressed: () {
            Get.back(); // Dismisses the snackbar
          },
          child: const Text(
            'CLOSE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        icon: const Icon(Icons.error, color: Colors.white),
        mainButton: TextButton(
          onPressed: () {
            Get.back(); // Dismisses the snackbar
          },
          child: const Text(
            'CLOSE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    // if (image != null) {
    //   selectedImagePath.value = image.path;
    //   Get.snackbar('Success', 'image selected',
    //       backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
    // } else {
    //   Get.snackbar('Error', 'No image selected',
    //       backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    // }
  }
}
