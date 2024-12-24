part of 'utils.dart';

class CameraHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> openCamera() async {
    if (await PermissionHelper.camera()) {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front
      );

      if (pickedFile == null) return null;

      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  static Future<File?> openGallery() async {
    if (await PermissionHelper.camera()) {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (pickedFile == null) return null;

      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
