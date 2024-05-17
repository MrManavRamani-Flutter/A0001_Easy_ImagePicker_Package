# My Image Picker

A Flutter package for picking images using Provider, GetX, and BLoC.

## Features

- Pick image from camera
- Pick image from gallery

## Usage

### Using Provider

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_image_picker/my_image_picker.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => ImagePickerProvider(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerExample(),
    );
  }
}

class ImagePickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imagePickerProvider.imageModel == null
                ? Text('No image selected.')
                : Image.file(imagePickerProvider.imageModel!.pathFile!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => imagePickerProvider.pickImage(ImageSource.camera),
              child: Text('Pick Image from Camera'),
            ),
            ElevatedButton(
              onPressed: () => imagePickerProvider.pickImage(ImageSource.gallery),
              child: Text('Pick Image from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
