import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initializeNotification() async {
  final bool? result = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(alert: true, badge: true, sound: true);
  print('iOS 알림 권한: $result');

  const DarwinInitializationSettings initializationSettingsIOS =
  DarwinInitializationSettings();

  const InitializationSettings initializationSettings =
  InitializationSettings(iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(String title, String msg) async {
  const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
  const NotificationDetails platformDetails =
  NotificationDetails(iOS: iosDetails);
  await flutterLocalNotificationsPlugin.show(
    1,
    title,
    msg,
    platformDetails,
  );


}