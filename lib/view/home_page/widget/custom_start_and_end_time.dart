import 'package:flutter/material.dart';
import 'package:to_do_app/core/constant/color.dart';

class CustomStartAndEndTime extends StatelessWidget {
  final BoxConstraints constraints;
  final String startTime;
  final String endTime;
  const CustomStartAndEndTime(
      {Key? key,
      required this.constraints,
      required this.startTime,
      required this.endTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.access_time_filled,
          color: AppColor.white,
        ),
        SizedBox(
          width: constraints.maxWidth / 30,
        ),
        Text(
          startTime,
          style: const TextStyle(color: AppColor.white, fontSize: 15),
        ),
        const Text(
          " - ",
          style: TextStyle(color: AppColor.white, fontSize: 15),
        ),
        Text(
          endTime,
          style: const TextStyle(color: AppColor.white, fontSize: 15),
        ),
      ],
    );
  }
}
