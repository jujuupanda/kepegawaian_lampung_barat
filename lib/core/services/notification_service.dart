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
      // to handle event when we receive notification
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            importance: Importance.high, priority: Priority.high);

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      0, // ID notifikasi
      'Judul Notifikasi',
      'Isi dari notifikasi ini',
      notificationDetails,
    );
  }

  static Future<void> scheduleNotification() async {
    await _notificationsPlugin.zonedSchedule(
      1, // ID notifikasi
      'Notifikasi Terjadwal',
      'Ini adalah isi notifikasi yang dijadwalkan',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)), // Waktu
      const NotificationDetails(
        android: AndroidNotificationDetails('channel_id', 'channel_name'),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
