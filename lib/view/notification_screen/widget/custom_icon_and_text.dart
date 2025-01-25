import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimensions_screen.dart';

class CustomIconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomIconAndText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.white,
          size: 30,
        ),
        SizedBox(
          width: widthScreen / 20,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 25.sp, color: AppColor.white),
        )
      ],
    );
  }
}
