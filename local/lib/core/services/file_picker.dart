import 'package:file_picker/file_picker.dart';

class FilePickerService {
  static Future<String?> pickPDFFile() async {
    return _pickFileByType(['pdf']);
  }

  static Future<String?> pickImageFile() async {
    return _pickFileByType(['jpg', 'jpeg', 'png']);
  }

  static Future<String?> pickVideoFile() async {
    return _pickFileByType(['mp4', 'avi', 'mov']);
  }

  static Future<String?> _pickFileByType(List<String> allowedExtensions) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      return file.path;
    } else {
      return null;
    }
  }
}
