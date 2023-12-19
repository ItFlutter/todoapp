import 'package:get/get.dart';
import 'package:to_do_app/core/class/notificationapi.dart';
import 'package:to_do_app/core/class/sqldb.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SqlDb());
    Get.put(NotificationApi());
    // TODO: implement dependencies
  }
}
