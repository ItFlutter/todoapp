import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/class/notificationapi.dart';
import 'package:timezone/timezone.dart' as tz;

class TestController extends GetxController {
  Time time = Time(9, 30, 59);

  getFlutterNativeTimezone() async {
    // final String currentTimeZone =
    //     await FlutterNativeTimezone.getLocalTimezone();
    // print(currentTimeZone);
    print(
        "tz.local.currentTimeZone==============================================${tz.TZDateTime.now(tz.local)}");

    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    print(
        "tz.local.currentTimeZone==============================================${tz.TZDateTime.now(tz.local)}");

    // print(
    //     "tz.getLocation==============================================${tz.getLocation(currentTimeZone)}");
  }

  getCurrentLocation() {
    print(Geolocator.getCurrentPosition());
  }

  onPressedButton() {
    // print(DateTime.sunday);
    // print(Day.tuesday);
    // print(DateTime(2023, 12, 17).weekday);

    // print(tz.TZDateTime.from(DateTime.now(), tz.local));
    // print(DateTime.now());
  }

  @override
  void onInit() {
    // print(tz.local);

    // NotificationApi().showNotification(0, "Hey", "How Are You");
    // print(time.second);
    // TODO: implement onInit
    super.onInit();
  }
}
