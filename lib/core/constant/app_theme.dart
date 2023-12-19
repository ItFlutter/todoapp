import 'package:flutter/material.dart';
import 'package:to_do_app/core/constant/color.dart';

ThemeData themeLight = ThemeData.light().copyWith(
    // bottomSheetTheme:
    //     const BottomSheetThemeData(modalBackgroundColor: AppColor.white),
    hintColor: AppColor.black,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
    ));
ThemeData themeDark = ThemeData.dark().copyWith(
    hintColor: AppColor.white,
    // bottomSheetTheme:
    //     const BottomSheetThemeData(backgroundColor: AppColor.grey),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
    ));
