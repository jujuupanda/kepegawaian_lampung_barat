part of 'services.dart';

class PermissionHandlerService {
  static Future<bool> requestPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted) {
      return true;
    }
    if (status.isPermanentlyDenied) {
      AppSettings.openAppSettings();
      return false;
    }
    final result = await permission.request();
    return result.isGranted;
  }
}
