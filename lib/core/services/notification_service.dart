part of 'services.dart';

class NotificationService {
  // Instance of Flutter notification plugin
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // Initialization setting for android
    const InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(
      initializationSettingsAndroid,
      onDidReceiveNotificationResponse: _handleNotificationClick,
      onDidReceiveBackgroundNotificationResponse: _notificationTapBackground,
    );
  }

  static Future<void> showNotification({
    required String title,
    required String content,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      content,
      notificationDetails,
      payload: payload,
    );
  }
}

/// Callback untuk notifikasi saat di foreground
void _handleNotificationClick(NotificationResponse response) async {
  if (response.payload != null) {
    FileHelper.openFile(response.payload!);
  }
}

/// Callback untuk notifikasi saat di background
@pragma('vm:entry-point')
void _notificationTapBackground(NotificationResponse response) {
  if (response.payload != null) {
    FileHelper.openFile(response.payload!);
  }
}
