import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/homepage_controller.dart';
import 'package:to_do_app/core/constant/dimensions_screen.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/image_asset.dart';

class CustomBodyNoTasks extends GetView<HomePageController> {
  final double height;
  final double width;
  const CustomBodyNoTasks({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: height / 2),
      children: [
        Opacity(
          opacity: 0.5,
          child: SvgPicture.asset(
            AppImageAsset.task,
            color: AppColor.primaryColor,
            width: widthScreen / 5,
            height: heightScreen / 8,
          ),
        ),
        SizedBox(
          height: height / 100,
        ),
        const Text(
          "You do not have any tasks yet!\nAdd new tasks to make you days productive.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
