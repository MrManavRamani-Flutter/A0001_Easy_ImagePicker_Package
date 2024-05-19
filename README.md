# My Image Picker

A Flutter package for picking images using Provider, GetX, and BLoC.

## Features

- Pick image from camera
- Pick image from gallery

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  my_image_picker:
    git:
      url: https://github.com/MrManavRamani-Flutter/A0001_Easy_ImagePicker_Package.git
```

Then, run flutter pub get to install the package.

## Usage
### Using Provider

#### 1. Import the package

```yaml
import 'package:image_picker_provider/image_picker_provider.dart';
```

#### 2. Instantiate the provider
```dart
ImagePickerProvider imagePickerProvider = ImagePickerProvider();
```

#### 3. Pick an image
```dart
// Pick from gallery
await imagePickerProvider.pickImage(ImageSource.gallery);

// Pick from camera
await imagePickerProvider.pickImage(ImageSource.camera);
```

#### 4. Access the picked image
```dart
ImageModel? pickedImage = imagePickerProvider.imageModel;
```

### Example
```dart

import 'package:flutter/material.dart';
import 'package:image_picker_provider/image_picker_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final ImagePickerProvider imagePickerProvider = ImagePickerProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await imagePickerProvider.pickImage(ImageSource.gallery);
            ImageModel? pickedImage = imagePickerProvider.imageModel;
            // Use the pickedImage...
          },
          child: Text('Pick Image'),
        ),
      ),
    );
  }
}
```


## Repository

The source code of this package is available on [GitHub](https://github.com/MrManavRamani-Flutter/A0001_Easy_ImagePicker_Package).
