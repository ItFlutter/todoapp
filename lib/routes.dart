import 'package:get/get.dart';
import 'package:to_do_app/core/constant/routes.dart';
import 'package:to_do_app/view/screen/addtask.dart';
import 'package:to_do_app/view/screen/homepage.dart';
import 'package:to_do_app/view/screen/notificationscreen.dart';
import 'package:to_do_app/view/screen/test.dart';

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
