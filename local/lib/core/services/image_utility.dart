import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageUtilityService {
  Future<File?> pickImageFromGallery({bool cropImage = false});

  Future<File?> pickImageFromCamera({bool cropImage = false});

  Future<File?> pickImage({bool cropImage = false, CropAspectRatioPreset? aspectRatio});
}

class ImageUtilityServiceImplementation implements ImageUtilityService {
  @override
  Future<File?> pickImageFromGallery({bool cropImage = false}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (cropImage && pickedFile != null) {
      return await cropSelectedImage(pickedFile.path);
    }

    return pickedFile != null ? File(pickedFile.path) : null;
  }

  @override
  Future<File?> pickImageFromCamera({bool cropImage = false}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (cropImage && pickedFile != null) {
      return await cropSelectedImage(pickedFile.path);
    }

    return pickedFile != null ? File(pickedFile.path) : null;
  }

 
  @override
  Future<File?> pickImage({bool cropImage = false, CropAspectRatioPreset? aspectRatio }) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
        'heif',
        'webp',
        'tiff',
        'psd',
        'ai',
      ],
      allowMultiple: false,
    );

    if (result == null || result.files.isEmpty) return null;

    if (cropImage) {
      final croppedFile = await cropSelectedImage(result.files.first.path!, aspectRatio);
      return File(croppedFile!.path);
    }

    return File(result.files.first.path!);
  }

  Future<File?> cropSelectedImage(String filePath, [CropAspectRatioPreset? aspectRatioPreset]) async {
    final imageCropper = ImageCropper();
    final file = await imageCropper.cropImage(
      sourcePath: filePath,
      maxHeight: 800,
      maxWidth: 800,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      aspectRatioPresets: aspectRatioPreset != null ?  [
        aspectRatioPreset
      ] : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
    );
    if (file == null) {
      return null;
    } else {
      return File(file.path);
    }
  }
}
