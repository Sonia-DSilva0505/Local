import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as path_helper;

import '../utility/log_utility.dart';

class ShareService {
  static Future<void> shareImages(List<String> filePaths) async {
    try {
      final List<XFile> files = filePaths.map((path) {
        final fileName = path_helper.basenameWithoutExtension(path);
        return XFile(path, name: fileName);
      }).toList();

      final String title =
          path_helper.basenameWithoutExtension(files.first.name);

      await Share.shareXFiles(
        files,
        text: title,
      );
    } catch (e) {
      LogUtility.info('Failed to share images: $e');
    }
  }
}
