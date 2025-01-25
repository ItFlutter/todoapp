import 'package:flutter/material.dart';
import 'package:to_do_app/core/constant/color.dart';
import 'package:to_do_app/view/home_page/widget/custom_start_and_end_time.dart';

class CustomTask extends StatelessWidget {
  final BoxConstraints constraints;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  const CustomTask(
      {Key? key,
      required this.constraints,
      required this.title,
      required this.note,
      required this.startTime,
      required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColor.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        SizedBox(
          height: constraints.maxWidth / 30,
        ),
        CustomStartAndEndTime(
            constraints: constraints, startTime: startTime, endTime: endTime),
        SizedBox(
          height: constraints.maxWidth / 30,
        ),
        Text(
          note,
          style: const TextStyle(
              color: AppColor.white, fontWeight: FontWeight.w300, fontSize: 17),
        ),
      ],
    );
  }
}
