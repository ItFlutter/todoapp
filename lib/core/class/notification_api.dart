import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:to_do_app/core/sevices/sevices.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final onClickNotification = BehaviorSubject<String>();
  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  MyServices myServices = Get.find();
  //  deleteNotificaion(int id) async {
  //   await myServices.flutterLocalNotificationsPlugin.cancel(id);
  // }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
      'channelId', 'channelName',
      // importance: Importance.max,
      // priority: Priority.high,
      // fullScreenIntent: true,
      // enableVibration: true,
      // playSound: true
    ));
  }

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    // AndroidInitializationSettings androidInitialize =
    //     const AndroidInitializationSettings("mipmap/ic_launcher");
    AndroidInitializationSettings androidInitialize =
        const AndroidInitializationSettings("appicon");
    DarwinInitializationSettings iosInitialize =
        const DarwinInitializationSettings();

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap,
        onDidReceiveNotificationResponse: onNotificationTap);
    print("Initialize Notification");
  }

  Future showNotification(
      int id, String? title, String? body, String? payload) async {
    await myServices.flutterLocalNotificationsPlugin
        .show(id, title, body, notificationDetails(), payload: payload);
  }

  Future scheduleNotification(int id, String? title, String? body,
      DateTime scheduleDateTime, String? payload) async {
    await myServices.flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleDateTime, tz.local),
        notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future scheduleNotificationDaily(
      int id,
      String? title,
      String? body,
      int year,
      int month,
      int day,
      int hour,
      int minute,
      int second,
      int millisecond,
      int microsecond,
      String? payload) async {
    await myServices.flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime(tz.local, year, month, day, hour, minute, second,
            millisecond, microsecond),
        notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future scheduleNotificationWeekly(
      int id,
      String? title,
      String? body,
      int year,
      int month,
      int day,
      int hour,
      int minute,
      int second,
      int millisecond,
      int microsecond,
      String? payload) async {
    await myServices.flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduleWeekly(
            year, month, day, hour, minute, second, millisecond, microsecond,
            days: [
              DateTime.monday,
              DateTime.tuesday,
              DateTime.wednesday,
              DateTime.thursday,
              DateTime.friday,
              DateTime.saturday,
              DateTime.sunday
            ]),
        notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future scheduleNotificationMonthly(
      int id,
      String? title,
      String? body,
      int year,
      int month,
      int day,
      int hour,
      int minute,
      int second,
      int millisecond,
      int microsecond,
      String? payload) async {
    await myServices.flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduleMonthly(
          year,
          month,
          day,
          hour,
          minute,
          second,
          millisecond,
          microsecond,
        ),
        notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  scheduleWeekly(
      year, month, day, hour, minute, second, millisecond, microsecond,
      {required List days}) {
    DateTime scheduledate = tz.TZDateTime(tz.local, year, month, day, hour,
        minute, second, millisecond, microsecond);
    while (!days.contains(scheduledate.weekday)) {
      scheduledate.add(const Duration(days: 1));
    }
    return scheduledate;
  }

  scheduleMonthly(
    year,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  ) {
    DateTime scheduledate = tz.TZDateTime(tz.local, year, month, day, hour,
        minute, second, millisecond, microsecond);
    // while (!days.contains(scheduledate.weekday)) {
    //   scheduledate.add(const Duration(days: 1));
    // }
    return scheduledate;
  }
}
