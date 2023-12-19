import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/homepage_controller.dart';
import 'package:to_do_app/core/class/handlingdataview.dart';
import 'package:to_do_app/core/class/notificationapi.dart';
import 'package:to_do_app/core/constant/color.dart';
import 'package:to_do_app/core/constant/dimensions_screen.dart';
import 'package:to_do_app/core/constant/image_asset.dart';
import 'package:to_do_app/core/constant/routes.dart';
import 'package:to_do_app/core/shared/custom_button.dart';
import 'package:to_do_app/view/widget/homepage/custom_avatar.dart';
import 'package:to_do_app/view/widget/homepage/custom_body_no_tasks.dart';
import 'package:to_do_app/view/widget/homepage/custombuttonbottomsheet.dart';
import 'package:to_do_app/view/widget/homepage/customstatustask.dart';
import 'package:to_do_app/view/widget/homepage/customtask.dart';
import '../../core/constant/app_theme.dart';
import '../widget/homepage/custom_date_now.dart';
import '../widget/homepage/custom_date_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        leading: GetBuilder<HomePageController>(
          builder: (controller) {
            return IconButton(
                onPressed: () {
                  controller.changeMode();
                },
                icon: controller.myServices.sharedPreferences
                            .getString("theme") ==
                        "dark"
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.nightlight_round));
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              controller.deleteAllData();
              await controller.myServices.flutterLocalNotificationsPlugin
                  .cancelAll();
            },
            icon: const Icon(Icons.cleaning_services_outlined),
          ),
          const CustomAvatar(
            avatarImage: AppImageAsset.avatar,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthScreen / 20, vertical: heightScreen / 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomDateNow(),
                CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.addtask);
                    // controller.insertData();
                  },
                  text: "+ Ad Task",
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: widthScreen / 20, top: heightScreen / 130),
              child: const CustomDatePicker()),
          GetBuilder<HomePageController>(builder: ((controller) {
            return Expanded(
                child: RefreshIndicator(onRefresh: () async {
              await controller.getData();
            }, child: LayoutBuilder(builder: (context, constraints) {
              return HandlingDataView(
                  onRefresh: () async {
                    controller.onRefresh();
                  },
                  height: constraints.maxHeight,
                  statusRequest: controller.statusRequest,
                  widget: controller.task.isEmpty
                      ? CustomBodyNoTasks(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                        )
                      : ListView.builder(
                          itemCount: controller.task.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                    backgroundColor: controller
                                                .myServices.sharedPreferences
                                                .getString("theme") ==
                                            "dark"
                                        ? AppColor.bottomSheetDarkColor
                                        : AppColor.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    Container(
                                        margin: EdgeInsets.only(
                                          left: widthScreen / 25,
                                          right: widthScreen / 25,
                                          top: widthScreen / 15,
                                          bottom: widthScreen / 10,
                                        ),
                                        height: controller.task[index].status ==
                                                "TODO"
                                            ? heightScreen / 3
                                            : heightScreen / 4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            controller.task[index].status ==
                                                    "TODO"
                                                ? CustomButtonBottomSheet(
                                                    text: "Task Completed",
                                                    onPressed: () async {
                                                      await controller
                                                          .completeTask(
                                                              controller
                                                                  .task[index]
                                                                  .id!);
                                                      print("After Complete");
                                                      Get.back();
                                                      print("After Get");
                                                    },
                                                  )
                                                : Container(),
                                            CustomButtonBottomSheet(
                                              text: "Delete Task",
                                              onPressed: () async {
                                                await controller.deleteData(
                                                    controller.task[index].id!);
                                                print("After delete");

                                                Get.back();
                                                print("After get");
                                              },
                                              isDelete: true,
                                            ),
                                            const Divider(
                                              thickness: 1.5,
                                            ),
                                            CustomButtonBottomSheet(
                                              text: "Cancel",
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        )));
                                // showModalBottomSheet(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(20),
                                //           topRight: Radius.circular(20))),
                                //   context: context,
                                //   builder: (context) {
                                //     return SizedBox(
                                //       height: heightScreen / 3,
                                //       child: LayoutBuilder(
                                //         builder: ((context, constraints2) {
                                //           return Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceEvenly,
                                //             children: [
                                //               controller.task[index].status ==
                                //                       "TODO"
                                //                   ? CustomButtonBottomSheet(
                                //                       constraints: constraints2,
                                //                       text: "Task Completed",
                                //                       onPressed: () {},
                                //                     )
                                //                   : Container(),
                                //               CustomButtonBottomSheet(
                                //                 constraints: constraints2,
                                //                 text: "Delete Task",
                                //                 onPressed: () {},
                                //                 isDelete: true,
                                //               ),
                                //               const Divider(
                                //                 thickness: 1.5,
                                //               ),
                                //               CustomButtonBottomSheet(
                                //                 constraints: constraints2,
                                //                 text: "Cancel",
                                //                 onPressed: () {
                                //                   Get.back();
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         }),
                                //       ),
                                //     );
                                //   },
                                // );
                              },
                              child: Container(
                                // key: controller.containerKey,
                                margin: EdgeInsets.only(
                                    top: constraints.maxHeight / 50,
                                    left: constraints.maxWidth / 20,
                                    right: constraints.maxWidth / 20),
                                padding: EdgeInsets.symmetric(
                                  vertical: constraints.maxHeight / 25,
                                  horizontal: constraints.maxWidth / 25,
                                ),
                                decoration: BoxDecoration(
                                    color: controller.setColor(int.parse(
                                        controller.task[index].color!)),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CustomTask(
                                            constraints: constraints,
                                            title:
                                                controller.task[index].title!,
                                            note: controller.task[index].note!,
                                            startTime: controller
                                                .task[index].starttime!,
                                            endTime: controller
                                                .task[index].endtime!),
                                      ),
                                      CustomStatusTask(
                                          status:
                                              controller.task[index].status!)
                                    ]),
                              ),
                            );
                          })));
            })));
          }))
        ],
      ),
    );
  }
}
