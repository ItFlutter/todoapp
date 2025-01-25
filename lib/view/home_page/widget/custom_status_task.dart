import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomStatusTask extends StatelessWidget {
  final String status;

  const CustomStatusTask({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 100,
          child: VerticalDivider(
            color: AppColor.white,
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            status,
            style: const TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
        ),
      ],
    );
  }
}
