part of 'utils.dart';

class LocationHelper {
  static Future<bool> locationChecker(String location) async {
    _GeoPositionModel officeLocation;
    final double radius = 100.0;

    switch (location) {
      case "primary":
        officeLocation = officeLocationPrimary();
        break;
      case "secondary":
        officeLocation = officeLocationSecondary();
        break;
      case "tertiary":
        officeLocation = officeLocationTertiary();
        break;
      default:
        return false;
    }

    final currentLocation = await getCurrentLocation();
    if (currentLocation == null) {
      return false;
    } else {
      double distance = Geolocator.distanceBetween(
        officeLocation.latitude,
        officeLocation.longitude,
        currentLocation.latitude,
        currentLocation.longitude,
      );
      return distance <= radius;
    }
  }

  static Future<Position?> getCurrentLocation() async {
    if (await PermissionHelper.location()) {
      return await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 25,
        ),
      );
    } else {
      return null;
    }
  }

  static officeLocationPrimary() {
    return _setLocationHelper(-5.020361, 104.060666);
  }

  static officeLocationSecondary() {
    return _setLocationHelper(-5.020361, 104.060666);
  }

  static officeLocationTertiary() {
    return _setLocationHelper(-5.409418, 105.413399);
  }

  static _setLocationHelper(double latitude, double longitude) {
    return _GeoPositionModel(latitude: latitude, longitude: longitude);
  }
}

class _GeoPositionModel {
  final double latitude;
  final double longitude;

  const _GeoPositionModel({
    required this.latitude,
    required this.longitude,
  });
}
