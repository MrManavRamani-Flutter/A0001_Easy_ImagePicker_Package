# My Image Picker

A Flutter package for picking images using Provider, GetX, and BLoC.

## Features

- Pick image from camera
- Pick image from gallery

# Image Picker Provider Package

This package provides a convenient way to handle image picking and capturing using the Flutter framework with the help of the `image_picker` package and `provider` package.

## Usage

### Using Provider


#### 1. Add Dependencies

First, you need to add the required dependencies to your `pubspec.yaml` file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^5.0.0
  a0001_easy_image_picker:
    git:
      url: https://github.com/MrManavRamani-Flutter/A0001_Easy_ImagePicker_Package.git
      ref: master
```

### 2. Initialize the Provider

To start using the `ImagePickerProvider` in your Flutter app, you need to initialize it in the main file (`main.dart`). This step ensures that the provider is available throughout your app.
    
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/image_picker_provider.dart'; // Import the ImagePickerProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // add Image Picker Provider
        ChangeNotifierProvider(
          create: (_) => ImagePickerProvider(), // Initialize ImagePickerProvider
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Picker User Package',
        routes: {
          // list your routes 
        },
      ),
    );
  }
}
```

#### 3. Implementing Image Selection and Capture Functions

```dart
void _pickImage(BuildContext context) {
  context.read<ImagePickerProvider>().pickImage();
}

void _takePhoto(BuildContext context) {
  context.read<ImagePickerProvider>().takeImage();
}

```

## Example :

```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final selectedImage = context.watch<ImagePickerProvider>().selectedImage;

    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: selectedImage != null
                  ? Image.file(File(selectedImage.pathString!))
                  : const Text('No image selected'),
            ),
            // Select Image
            ElevatedButton(
              onPressed: () => _pickImage(context),
              child: const Text('Pick Image'),
            ),
            // camera Image 
            ElevatedButton(
              onPressed: () => _takePhoto(context),
              child: const Text('Take Image'),
            ),
          ],
        ),
      ),
    );
  }

  // Select Image Function
  void _pickImage(BuildContext context) {
    context.read<ImagePickerProvider>().pickImage();
  }

  // camera Image Function
  void _takePhoto(BuildContext context) {
    context.read<ImagePickerProvider>().takeImage();
  }
}
```