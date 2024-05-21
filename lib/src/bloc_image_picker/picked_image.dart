// lib/src/bloc_image_picker/picked_image.dart

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageModel {
  final String? pathString;
  final File? pathFile;
  final XFile? pathXFile;

  ImageModel({
    this.pathString,
    this.pathFile,
    this.pathXFile,
  });

  factory ImageModel.fromXFile(XFile xfile) {
    return ImageModel(
      pathString: xfile.path,
      pathFile: File(xfile.path),
      pathXFile: xfile,
    );
  }
}
