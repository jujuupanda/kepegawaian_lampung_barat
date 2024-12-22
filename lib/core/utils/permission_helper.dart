part of 'utils.dart';


class PermissionHelper {
  static void location() async {
    final isGranted =
        await PermissionHandlerService.requestPermission(Permission.location);
    if (isGranted) {
      print("akses lokasi diizinkan");
    } else {
      print("akses lokasi ditolak");
    }
  }

  static void camera() async {
    final isGranted =
        await PermissionHandlerService.requestPermission(Permission.camera);
    if (isGranted) {
      print("akses kamera diizinkan");
    } else {
      print("akses kamera ditolak");
    }
  }

  static void handleMultiplePermissions() async {
    var statuses = await PermissionHandlerService.requestMultiplePermissions([
      Permission.camera,
      Permission.microphone,
      Permission.location,
    ]);

    statuses.forEach((permission, status) {
      if (status.isGranted) {
        print("$permission diberikan");
      } else if (status.isPermanentlyDenied) {
        print("$permission ditolak secara permanen. Arahkan ke pengaturan.");
      } else {
        print("$permission ditolak sementara");
      }
    });
  }
}
