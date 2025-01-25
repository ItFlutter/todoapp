import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimensions_screen.dart';

class CustomTitleAndSubTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomTitleAndSubTitle(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.sp)),
        SizedBox(
          height: heightScreen / 90,
        ),
        Text(subTitle,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.grey)),
      ],
    );
  }
}
