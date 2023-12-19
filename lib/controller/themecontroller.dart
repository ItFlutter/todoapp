import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/constant/app_theme.dart';
import 'package:to_do_app/core/sevices/sevices.dart';

class ThemeController extends GetxController {
  late ThemeData appTheme;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    String? sharedPrefTheme = myServices.sharedPreferences.getString("theme");
    if (sharedPrefTheme == "dark") {
      appTheme = themeDark;
    } else {
      appTheme = themeLight;
    }
    super.onInit();
  }
}
