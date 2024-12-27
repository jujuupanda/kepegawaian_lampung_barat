part of 'utils.dart';

class PermissionHelper {
  static Future<bool> location() async {
    return await PermissionHandlerService.requestPermission(
        Permission.location);
  }

  static Future<bool> camera() async {
    return await PermissionHandlerService.requestPermission(Permission.camera);
  }

  static Future<bool> externalStorage() async {
    return await PermissionHandlerService.requestPermission(Permission.manageExternalStorage);
  }
}
