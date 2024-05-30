import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  tz.TZDateTime convertToTZDateTime(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.local);
  }

  Future<void> scheduleNotification(
      int id, String title, String body, DateTime scheduledTime,//5:30
      int intervalHours, DateTime start, DateTime end) async {//30min
    //final now = DateTime.now();
    final nextTriggerTime = scheduledTime.add(Duration(hours: intervalHours));
//6:00
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'medication_channel_id',
      'Medication Reminders',
      channelDescription: 'Channel for medication reminders',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      ticker: 'ticker'
    );

    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),//5:30
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    while(start.isBefore(DateTime.now()) && end.isAfter(DateTime.now())) {
      Timer(Duration(hours: intervalHours), () =>
          scheduleNotification(
              id,
              title,
              body,
              nextTriggerTime,
              intervalHours,
              start,
              end));
    }
  }
  Future<void> periodicScheduleNotification(int id, String title, String body, DateTime scheduledTime) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'repeating channel id', 'repeating channel name',
        channelDescription: 'repeating description',);
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(0, title,
        body, RepeatInterval.everyMinute, notificationDetails,
        //androidAllowWhileIdle: true
    );
  }
}
