part of 'services.dart';

class UploadService {
  static Future<String?> uploadFile(String folderName, File file) async {
    final String fileName =
        DateFormat('yyyyMMdd_HHmmss').format(DateTime.now()).toString();

    final responseUpload = "await api.uploadFile";

    if (responseUpload == "") {
      final urlFile = "url file from responseUpload";
      return urlFile;
    }
    return null;
  }
}
