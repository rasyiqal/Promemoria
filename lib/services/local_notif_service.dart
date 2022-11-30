import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings(
          'logo'); /*menambahkan logo pada notifikasi */

  final IOSInitializationSettings _iosInitializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  void initialisetNotifications() async {
    //menginisialisasi notif
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
      iOS: _iosInitializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // void notifisya() async {
  //   sendNotification('ayo', 'body', 22, 35);
  // }

  //mengirim notifikasi /
  void sendNotification(String title, String body, int jam, int menit) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.schedule(
      0,
      title,
      body,
      DateTime(2022, 11, 30, jam, menit),
      // tz.TZDateTime.now(tz.local).add(
      //   Duration(seconds: 1),
      // ),
      notificationDetails,
    );
  }

/*mmengatur scedule notifikasi */
  void sceduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      //mengatur waktu notifikasi
      0,
      title,
      body,
      RepeatInterval.everyMinute,
      //mengulang notifikasi setiap menit
      notificationDetails,
    );
  }

  //menghentikan notifikasi
  void stopNotification() {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}
