import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:local/core/utility/log_utility.dart';
import 'package:local/core/utility/toast_message.dart';

class ImageSaveService {
  static Future<void> saveImage(Uint8List imageBytes, String name) async {
    try {
      final result = await ImageGallerySaver.saveImage(imageBytes, name: name );
      LogUtility.info('Image saved to gallery: $result');
      if (result != null) {
        AppAlert.showToast(message: 'Barcode saved to gallery');
      }
    } on PlatformException catch (e) {
      LogUtility.error('Failed to save image: $e');
    }
  }
}
