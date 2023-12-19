import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_app/core/constant/color.dart';

import '../constant/dimensions_screen.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      padding: EdgeInsets.symmetric(
          vertical: widthScreen / 25, horizontal: widthScreen / 23),
      color: AppColor.primaryColor,
      child: Text(
        text,
        style:
            const TextStyle(color: AppColor.white, fontWeight: FontWeight.w400),
      ),
    );
  }
}
