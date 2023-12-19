import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/class/notificationapi.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do_app/core/constant/routes.dart';
import 'package:to_do_app/core/functions/requestperlocation.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:to_do_app/view/screen/notificationscreen.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await NotificationApi.initialize(flutterLocalNotificationsPlugin);
    tz.initializeTimeZones();
    print(
        "tz.local.currentTimeZone==============================================${tz.TZDateTime.now(tz.local)}");
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    listenToNotification();
    print(
        "tz.local.currentTimeZone==============================================${tz.TZDateTime.now(tz.local)}");
    // await requestPerLocation();
    return this;
  }
}

listenToNotification() {
  NotificationApi.onClickNotification.stream.listen((String event) {
    Get.to(() => NotificationScreen(payload: event));
  });
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
