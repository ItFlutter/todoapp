import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/constant/color.dart';
import 'package:to_do_app/core/constant/dimensions_screen.dart';
import 'package:to_do_app/core/constant/routes.dart';
import 'package:to_do_app/view/widget/notificationscreen/customiconandtext.dart';
import 'package:to_do_app/view/widget/notificationscreen/customtextnotification.dart';
import 'package:to_do_app/view/widget/notificationscreen/customtitleandsubtitle.dart';

class NotificationScreen extends StatelessWidget {
  final String payload;
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.homepage);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.white,
            )),
        title: const Text(
          "Title",
          style: TextStyle(
            color: AppColor.white,
          ),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: widthScreen / 12, vertical: heightScreen / 40),
        width: widthScreen,
        child: Column(
          children: [
            const CustomTitleAndSubTitle(
                title: "Hello, Ahmad", subTitle: "You have a new reminder"),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Card(
                    margin: EdgeInsets.only(top: heightScreen / 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: AppColor.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthScreen / 20,
                          vertical: heightScreen / 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomIconAndText(
                              icon: Icons.text_format, text: "Title"),
                          CustomTextNotification(
                              text: "${payload.split(',')[0]}"),
                          const CustomIconAndText(
                              icon: Icons.description, text: "Description"),
                          CustomTextNotification(
                              text: "${payload.split(',')[1]}"),
                          const CustomIconAndText(
                              icon: Icons.calendar_today, text: "Date"),
                          CustomTextNotification(
                              text:
                                  '${payload.split(',')[2]}:${payload.split(',')[3]}'),
                          SizedBox(
                            height: constraints.maxHeight / 2.1,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
