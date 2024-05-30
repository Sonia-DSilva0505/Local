import 'dart:io';

import 'package:barcode_image/barcode_image.dart';
import 'package:image/image.dart' as im;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class BarcodeService {
  static String generateBarcode(String data, BarcodeType type) {
    final barcode = Barcode.code128(escapes: true);

    return barcode.toSvg(data);
  }

  static Future<File?> generateBarcodeWithImageFile(
      String data, final name) async {
    try {
      // Create an image
      final image = im.Image(width: 1080, height: 540);

      // Fill it with a solid color (white)
      im.fill(image, color: im.ColorRgb8(255, 255, 255));

      // Draw the barcode
      drawBarcode(
        image,
        Barcode.code128(),
        data,
        font: im.arial24,
        width: 980,
        height: 440,
        x: 50,
        y: 50,
        textPadding: 10,
      );

      // Get the temporary directory
      final Directory tempDir = await getTemporaryDirectory();

      // Save the image to the temporary directory
      final String filePath = path.join(tempDir.path, '$name.png');
      File(filePath).writeAsBytesSync(im.encodePng(image));
      return File(filePath);
    } catch (e) {
      return null;
    }
  }
}
