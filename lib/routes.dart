import 'package:get/get.dart';
import 'package:to_do_app/core/constant/routes.dart';
import 'package:to_do_app/view/add_task/screen/add_task.dart';
import 'package:to_do_app/view/home_page/screen/home_page.dart';
import 'package:to_do_app/view/notification_screen/screen/notification_screen.dart';
import 'package:to_do_app/view/test/screen/test.dart';

List<GetPage<dynamic>>? routes = [
  //================================Homepage============================
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  // GetPage(name: AppRoute.homepage, page: () => const Test()),
  // GetPage(name: AppRoute.homepage, page: () => const NotificationScreen()),
  //================================AddTask============================
  GetPage(name: AppRoute.addtask, page: () => const AddTask()),
  //================================Notification============================
  // GetPage(name: AppRoute.notification, page: () => const NotificationScreen(payload: "",))
];
