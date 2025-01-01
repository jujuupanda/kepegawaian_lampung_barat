part of 'utils.dart';

class SecureStorageHelper {
  static final _storageService = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    return await _storageService.write(
      key: key,
      value: value,
    );
  }

  static Future<String?> read({required String key}) async {
    return await _storageService.read(
      key: key,
    );
  }

  static Future<Map<String, dynamic>?> readAll() async {
    return await _storageService.readAll();
  }

  static Future<void> delete({required String key}) async {
    await _storageService.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storageService.deleteAll();
  }
}
