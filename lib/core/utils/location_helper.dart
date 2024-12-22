part of 'utils.dart';


class LocationHelper {
  static Future<Position> currentLocation() async {
    PermissionHelper.location();
    return await Geolocator.getCurrentPosition();
  }
}
