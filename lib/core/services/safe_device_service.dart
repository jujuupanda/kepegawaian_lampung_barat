part of 'services.dart';

class SafeDeviceService {
  static Future<SafeDeviceModel> checkDevice() async {
    final isJailBroken = await SafeDevice.isJailBroken;
    final isMockLocation = await SafeDevice.isMockLocation;
    final isRealDevice = await SafeDevice.isRealDevice;
    final isOnExternalStorage = await SafeDevice.isOnExternalStorage;
    final isSafeDevice = await SafeDevice.isSafeDevice;
    final isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;

    return SafeDeviceModel(
      isJailBroken: isJailBroken,
      isMockLocation: isMockLocation,
      isRealDevice: isRealDevice,
      isOnExternalStorage: isOnExternalStorage,
      isSafeDevice: isSafeDevice,
      isDevelopmentModeEnable: isDevelopmentModeEnable,
    );
  }

  static Future<void> checkAppVersion() async {
    final appInfo = await PackageInfo.fromPlatform();
    if (appInfo.version == "1.0.0") {
      print("Tidak perlu diperbarui");
    } else {
      print("Harus diperbarui");
    }
  }
}

class SafeDeviceModel {
  final bool isJailBroken;
  final bool isMockLocation;
  final bool isRealDevice;
  final bool isOnExternalStorage;
  final bool isSafeDevice;
  final bool isDevelopmentModeEnable;

  const SafeDeviceModel({
    required this.isJailBroken,
    required this.isMockLocation,
    required this.isRealDevice,
    required this.isOnExternalStorage,
    required this.isSafeDevice,
    required this.isDevelopmentModeEnable,
  });

  SafeDeviceModel copyWith({
    bool? isJailBroken,
    bool? isMockLocation,
    bool? isRealDevice,
    bool? isOnExternalStorage,
    bool? isSafeDevice,
    bool? isDevelopmentModeEnable,
  }) {
    return SafeDeviceModel(
      isJailBroken: isJailBroken ?? this.isJailBroken,
      isMockLocation: isMockLocation ?? this.isMockLocation,
      isRealDevice: isRealDevice ?? this.isRealDevice,
      isOnExternalStorage: isOnExternalStorage ?? this.isOnExternalStorage,
      isSafeDevice: isSafeDevice ?? this.isSafeDevice,
      isDevelopmentModeEnable:
          isDevelopmentModeEnable ?? this.isDevelopmentModeEnable,
    );
  }
}
