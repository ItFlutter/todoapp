import 'package:flutter/material.dart';
import 'package:to_do_app/core/constant/dimensions_screen.dart';

import '../../../core/constant/color.dart';

class CustomButtonBottomSheet extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool? isDelete;
  const CustomButtonBottomSheet(
      {Key? key, required this.text, required this.onPressed, this.isDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: widthScreen,
      color: isDelete == true ? AppColor.redColor : AppColor.primaryColor,
      padding: EdgeInsets.symmetric(vertical: widthScreen / 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColor.white, fontSize: 17),
      ),
    );
  }
}
