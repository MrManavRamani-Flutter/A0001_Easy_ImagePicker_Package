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
import 'package:provider/provider.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';  // Import this for ImagePickerProvider

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
        // Your Code
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


#### MyApp.dart
```dart
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';  // Import this for ImagePickerProvider
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImagePickerProvider(),
        ),
      ],
      child: MaterialApp(
      // Your Code Here
      ),
    );
  }
}
```

#### MyHomeScree.dart
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

##

## image_picker_getx

A Flutter package for picking images from the gallery or camera using GetX for state management. This package simplifies image picking and state management, providing an `ImagePickerController` and an `ImageModel`.

### Installation

#### Add the following dependencies to your `pubspec.yaml` to include this package directly from GitHub:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  image_picker: ^0.8.5+3
  image_picker_getx:
    git:
      url: https://github.com/MrManavRamani-Flutter/A0001_Easy_ImagePicker_Package.git
      ref: master
```

## Usage

### Step 1: Import the Package

#### Import the necessary files in your Dart code.


```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_getx/image_picker_controller.dart';
import 'dart:io';

```

### Step 2: Initialize the Controller
#### Create an instance of ImagePickerController using GetX.

```dart
final ImagePickerController imagePickerController = Get.put(ImagePickerController());

```


### Step 3: Use the Controller in Your Widget
#### Use the ImagePickerController to pick images and observe changes in the UI.

```dart
class ImagePickerWidget extends StatelessWidget {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() {
            return imagePickerController.selectedImage.value == null
                ? Text('No image selected')
                : Image.file(
                    imagePickerController.selectedImage.value!.pathFile!,
                    width: 200,
                    height: 200,
                  );
          }),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              imagePickerController.pickImage(ImageSource.camera);
            },
            child: Text('Pick Image from Camera'),
          ),
          ElevatedButton(
            onPressed: () {
              imagePickerController.pickImage(ImageSource.gallery);
            },
            child: Text('Pick Image from Gallery'),
          ),
        ],
      ),
    );
  }
}

```


## Full Example
#### Here is a complete example to get you started:


```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_getx/image_picker_controller.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker using GetX Package'),
        ),
        body: ImagePickerWidget(),
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() {
            return imagePickerController.selectedImage.value == null
                ? Text('No image selected')
                : Image.file(
                    imagePickerController.selectedImage.value!.pathFile!,
                    width: 200,
                    height: 200,
                  );
          }),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              imagePickerController.pickImage(ImageSource.camera);
            },
            child: Text('Pick Image from Camera'),
          ),
          ElevatedButton(
            onPressed: () {
              imagePickerController.pickImage(ImageSource.gallery);
            },
            child: Text('Pick Image from Gallery'),
          ),
        ],
      ),
    );
  }
}

```


## Additional Configuration

## Android
### Add the following permissions to your AndroidManifest.xml:

```manifest
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

```

## iOS
### Add the following keys to your Info.plist file:

```Info.plist
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take pictures</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select pictures</string>

```