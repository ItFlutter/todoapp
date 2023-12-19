import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/homepage_controller.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimensions_screen.dart';

class CustomDatePicker extends GetView<HomePageController> {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DatePicker(
          DateTime.now(),
          height: heightScreen / 8,
          width: widthScreen / 5.5,
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColor.primaryColor,
          daysCount: 90,
          selectedTextColor: Colors.white,
          dateTextStyle: TextStyle(
              color: AppColor.grey,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
          dayTextStyle: TextStyle(
              color: AppColor.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
          monthTextStyle: TextStyle(
              color: AppColor.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
          onDateChange: (date) {
            // New date selected
            controller.selectedDateTime = date;
            controller.getData();
            print(
                "selectedDateTime=================================${controller.selectedDateTime}");
            print(
                "selectedDateTime=================================${controller.selectedDateTime.toString().substring(0, 10)}");
          },
        ),
      ],
    );
  }
}
