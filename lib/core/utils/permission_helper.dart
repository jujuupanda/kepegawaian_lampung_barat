part of 'utils.dart';

///TODO: remove print and change with what to do
class PermissionHelper {
  static Future<bool> location() async {
    return await PermissionHandlerService.requestPermission(
        Permission.location);
  }

  static Future<bool> camera() async {
    return await PermissionHandlerService.requestPermission(Permission.camera);
  }
}
