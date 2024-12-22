part of 'utils.dart';

class AppDeviceHelper {
  static Future<bool> isDeviceSafe() async {
    final deviceInfo = await _checkDeviceSafe();
    ///TODO: change real device to false when it release
    if (deviceInfo.isJailBroken == true ||
        deviceInfo.isRealDevice == true ||
        deviceInfo.isOnExternalStorage == true ||
        deviceInfo.isDevelopmentModeEnable == true) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> isAppLatest() async {
    return await _checkAppVersion();
  }

  static Future<bool> isMockLocation() async {
    return await _checkMockLocation();
  }

  static Future<bool> isDeviceCompletelySafe() async {
    return await _checkIsSafeDeice();
  }

  static Future<_SafeDeviceModel> _checkDeviceSafe() async {
    final isJailBroken = await SafeDevice.isJailBroken;
    final isRealDevice = await SafeDevice.isRealDevice;
    final isOnExternalStorage = await SafeDevice.isOnExternalStorage;
    final isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;

    return _SafeDeviceModel(
      isJailBroken: isJailBroken,
      isRealDevice: isRealDevice,
      isOnExternalStorage: isOnExternalStorage,
      isDevelopmentModeEnable: isDevelopmentModeEnable,
    );
  }

  static Future<bool> _checkMockLocation() async {
    final isMockLocation = await SafeDevice.isMockLocation;

    return isMockLocation;
  }

  static Future<bool> _checkIsSafeDeice() async {
    final isSafeDevice = await SafeDevice.isSafeDevice;

    return isSafeDevice;
  }

  static Future<bool> _checkAppVersion() async {
    final appInfo = await PackageInfo.fromPlatform();
    if (appInfo.version == "1.0.0") {
      return true;
    } else {
      return false;
    }
  }
}

class _SafeDeviceModel {
  final bool isJailBroken;
  final bool isRealDevice;
  final bool isOnExternalStorage;
  final bool isDevelopmentModeEnable;

  const _SafeDeviceModel({
    required this.isJailBroken,
    required this.isRealDevice,
    required this.isOnExternalStorage,
    required this.isDevelopmentModeEnable,
  });

  _SafeDeviceModel copyWith({
    bool? isJailBroken,
    bool? isRealDevice,
    bool? isOnExternalStorage,
    bool? isDevelopmentModeEnable,
  }) {
    return _SafeDeviceModel(
      isJailBroken: isJailBroken ?? this.isJailBroken,
      isRealDevice: isRealDevice ?? this.isRealDevice,
      isOnExternalStorage: isOnExternalStorage ?? this.isOnExternalStorage,
      isDevelopmentModeEnable:
          isDevelopmentModeEnable ?? this.isDevelopmentModeEnable,
    );
  }
}
