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
        children: [
          Obx(() {
            return imagePickerController.selectedImagePath.value.isEmpty
                ? const Text('No image selected')
                : Image.file(
              File(imagePickerController.selectedImagePath.value),
              width: 200,
              height: 200,
            );
          }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
            child: const Text('Pick Image from Camera'),
          ),
          ElevatedButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            child: const Text('Pick Image from Gallery'),
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
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';
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
        body: MyHomeScreen(),
      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({super.key});

  final ImagePickerController imagePickerController =
  Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return imagePickerController.selectedImagePath.value.isEmpty
                  ? const Text('No image selected')
                  : Image.file(
                File(imagePickerController.selectedImagePath.value),
                width: 200,
                height: 200,
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              child: const Text('Pick Image from Camera'),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: const Text('Pick Image from Gallery'),
            ),
          ],
        ),
    );
  }

  void _pickImage(ImageSource source) {
    imagePickerController.pickImage(source);
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

```Info
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take pictures</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select pictures</string>

```


# Image Picker Example with BLoC

This is a Flutter example app demonstrating image picking functionality using the BLoC pattern with the `a0001_easy_image_picker` package.

## Features

- Pick images from the gallery
- Capture images using the camera
- Handle loading and error states
- Toast notifications for errors

## Installation

Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  image_picker: ^1.1.1
  flutter_bloc: ^8.1.5
  a0001_easy_image_picker:
    git:
      url: https://github.com/MrManavRamani-Flutter/A0001_Easy_ImagePicker_Package.git
      ref: master
```

## Usage
Follow the example below to use the a0001_easy_image_picker package in your Flutter app.

### Step 1: Add the Package to pubspec.yaml
In the pubspec.yaml of your Flutter app, add the a0001_easy_image_picker package dependency.

### Step 2: Create the Main Application
Create the main application file, lib/main.dart, to set up the BLoC provider and the home screen.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';
import 'views/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Image Picker',
      home: BlocProvider(
        create: (context) => ImagePickerBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}

```

### Step 3: Create the Home Screen
Create a new file, lib/views/screen/home_screen.dart, and define the UI for the home screen where users can interact with the image picker functionality.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker with BLoC")),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state is ImagePickerInitial) {
              return const Text("No image selected");
            } else if (state is ImagePickerLoading) {
              return const CircularProgressIndicator();
            } else if (state is ImagePickerLoaded) {
              return Image.file(state.image);
            } else if (state is ImagePickerError) {
              return Text("Error: ${state.message}");
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ImagePickerBloc>(context)
                  .add(PickImageEvent(ImageSource.camera));
            },
            tooltip: 'Pick Image from Camera',
            child: const Icon(Icons.camera),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ImagePickerBloc>(context)
                  .add(PickImageEvent(ImageSource.gallery));
            },
            tooltip: 'Pick Image from Gallery',
            child: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}

```

### Step 4: Run the Application
#### Run your Flutter application:

```shell
flutter run

```

#### This will start your app, and you will see a screen with two floating action buttons: one for picking an image from the camera and another for picking an image from the gallery.


## Full Example
#### Here is the complete code for a Flutter app using the a0001_easy_image_picker package.

#### pubspec.yaml

```yaml
name: image_picker_example
description: A Flutter example app to demonstrate image picking using BLoC.

publish_to: 'none' 

version: 1.0.0+1

environment:
  sdk: ">=2.17.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  image_picker: ^1.1.1
  flutter_bloc: ^8.1.5
  a0001_easy_image_picker:
    git:
      url: https://github.com/MrManavRamani-Flutter/A0001_Easy_ImagePicker_Package.git
      ref: master

dev_dependencies:
  flutter_test:
    sdk: flutter

```

#### lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';
import 'views/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Image Picker',
      home: BlocProvider(
        create: (context) => ImagePickerBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}

```

#### lib/views/screen/home_screen.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:a0001_easy_image_picker/a0001_easy_image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker with BLoC")),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state is ImagePickerInitial) {
              return const Text("No image selected");
            } else if (state is ImagePickerLoading) {
              return const CircularProgressIndicator();
            } else if (state is ImagePickerLoaded) {
              return Image.file(state.image);
            } else if (state is ImagePickerError) {
              return Text("Error: ${state.message}");
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ImagePickerBloc>(context)
                  .add(PickImageEvent(ImageSource.camera));
            },
            tooltip: 'Pick Image from Camera',
            child: const Icon(Icons.camera),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ImagePickerBloc>(context)
                  .add(PickImageEvent(ImageSource.gallery));
            },
            tooltip: 'Pick Image from Gallery',
            child: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}

```

#### This guide walks you through setting up your Flutter app to use the a0001_easy_image_picker package with BLoC for picking images. It includes the necessary steps and the complete code example.
