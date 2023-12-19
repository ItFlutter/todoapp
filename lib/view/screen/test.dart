import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/testcontroller.dart';
import 'package:to_do_app/core/class/notificationapi.dart';

import '../../core/constant/color.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TestController controller = Get.put(TestController());
    GlobalKey containerkeyy = GlobalKey();

    return Scaffold(
        appBar: AppBar(
            title: const Text("Test"), backgroundColor: AppColor.primaryColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  // NotificationApi().showNotification(0, "Hey", "How Are You");
                  controller.onPressedButton();
                },
                color: AppColor.primaryColor,
                textColor: AppColor.white,
                child: const Text("Show Notification"),
              ),
            )
          ],
        ));
  }
}
