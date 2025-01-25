import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

class CustomTextNotification extends StatelessWidget {
  final String text;
  const CustomTextNotification({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.sp, color: AppColor.white),
    );
  }
}
