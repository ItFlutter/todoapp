import 'package:get/get.dart';
import 'package:to_do_app/core/class/notification_api.dart';
import 'package:to_do_app/core/class/sql_db.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SqlDb());
    Get.put(NotificationApi());
    // TODO: implement dependencies
  }
}
