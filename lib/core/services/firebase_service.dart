part of 'services.dart';

class FirebaseService {
  static final firebaseMessaging = FirebaseMessaging.instance;

  //Initialize Firebase Messaging
  static void initialFirebaseMessaging() async {
    try {
      await firebaseMessaging.requestPermission();
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get FCM Token for notification/messaging
  static Future<String?> fcmToken() async {
    try {
      final fcmToken = await firebaseMessaging.getToken();
      return fcmToken;
    } catch (e) {
      throw Exception(e);
    }
  }
}
