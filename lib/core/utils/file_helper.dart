part of 'utils.dart';

class FileHelper {
  static Future<bool> _saveFile({
    required String baseFolder,
    required String folder,
    required String fileName,
    required Future<List<int>> getFileBytes,
  }) async {
    try {
      if (!await PermissionHelper.externalStorage()) {
        return false;
      }
      // Tentukan direktori penyimpanan
      Directory externalStorage = Directory('/storage/emulated/0');
      String folderPath = "${externalStorage.path}/$baseFolder/$folder";

      // Buat folder jika belum ada
      Directory targetDir = Directory(folderPath);
      if (!targetDir.existsSync()) {
        targetDir.createSync(recursive: true);
      }

      // Ambil data file
      final List<int> bytes = await getFileBytes;

      // Tentukan file path
      final File file = File("$folderPath/$fileName");

      // Simpan file
      await file.writeAsBytes(bytes, flush: true);

      NotificationService.showNotification(
          title: fileName,
          content: "File berhasil disimpan",
          payload: "$folderPath/$fileName");
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> savePdfExternal(String fileName) async {
    await FileHelper._saveFile(
      baseFolder: "Kominfo Lambar",
      folder: "Downloads",
      fileName: fileName,
      getFileBytes: PdfHelper.createPDF(),
    );
  }

  static Future<void> savePdfInternal(String fileName) async {
    if (await PermissionHelper.externalStorage()) {
      Directory? appDocDirectory = await getExternalStorageDirectory();
      final List<int> bytes = await PdfHelper.createPDF();
      final File file = File("${appDocDirectory?.path}/$fileName");
      await file.writeAsBytes(bytes, flush: true);
    }
  }

  // Found Error
  static Future<void> openExternalStorage(String folderPath) async {
    final Uri uri = Uri.file(folderPath);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not open folder: $folderPath";
    }
  }

  //Open File
  static void openFile(String filePath) {
    OpenFile.open(filePath);
  }
// static saveAndLaunchFile(List<int> bytes,String fileName) async {
//   final String path = (await getApplicationDocumentsDirectory()).path;
//   final File file = File("$path/$fileName");
//   await file.writeAsBytes(bytes, flush: true);
//   OpenFile.open("$path/$fileName");
// }
}
