import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/controller/addtaskcontroller.dart';
import 'package:to_do_app/core/class/handlingdataview.dart';
import 'package:to_do_app/core/constant/color.dart';
import 'package:to_do_app/core/constant/dimensions_screen.dart';
import 'package:to_do_app/core/constant/image_asset.dart';
import 'package:to_do_app/core/functions/validinput.dart';
import 'package:to_do_app/core/shared/custom_button.dart';
import 'package:to_do_app/view/widget/addtask/customdropdownbutton.dart';
import 'package:to_do_app/view/widget/addtask/customtext.dart';
import 'package:to_do_app/view/widget/addtask/customtextformfield.dart';

import '../widget/homepage/custom_avatar.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddTaskController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.grey,
              )),
          actions: const [
            CustomAvatar(
              avatarImage: AppImageAsset.avatar,
            )
          ],
        ),
        body: GetBuilder<AddTaskController>(
          builder: (controller) {
            return LayoutBuilder(
              builder: ((context, constraints) {
                print(constraints.maxHeight);
                print(constraints.maxWidth);
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  height: constraints.maxHeight,
                  onRefresh: () async {
                    controller.onRefresh();
                  },
                  widget: ListView(children: [
                    const Center(child: CustomText(text: "Add Task")),
                    Form(
                        key: controller.formState,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: widthScreen / 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightScreen / 70),
                                child: const CustomText(text: "Title"),
                              ),
                              CustomTextFormField(
                                  validator: (value) {
                                    return validInput(2, 255, value!);
                                  },
                                  hint: "Enter title here",
                                  controller: controller.title),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightScreen / 70),
                                child: const CustomText(text: "Note"),
                              ),
                              CustomTextFormField(
                                  hint: "Enter note here",
                                  validator: (value) {
                                    return validInput(2, 255, value!);
                                  },
                                  controller: controller.note),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightScreen / 70),
                                child: const CustomText(text: "Date"),
                              ),
                              CustomTextFormField(
                                isReadOnly: true,
                                hint: DateFormat.yMd().format(controller.date),
                                controller: controller.dateController,
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.calendar_today_outlined,
                                    color: AppColor.grey,
                                  ),
                                  onPressed: () {
                                    controller.setDate(context);
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: heightScreen / 70),
                                          child: const CustomText(
                                              text: "Start Time"),
                                        ),
                                        CustomTextFormField(
                                          isReadOnly: true,
                                          hint: controller.startTime
                                              .format(context),
                                          controller:
                                              controller.startTimeController,
                                          suffixIcon: IconButton(
                                            icon: const Icon(
                                              Icons.schedule,
                                              color: AppColor.grey,
                                            ),
                                            onPressed: () async {
                                              controller.setStartTime(context);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthScreen / 25,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: heightScreen / 70),
                                          child: const CustomText(
                                              text: "End Time"),
                                        ),
                                        CustomTextFormField(
                                          isReadOnly: true,
                                          hint: controller.endTime
                                              .format(context),
                                          controller:
                                              controller.endTimeController,
                                          suffixIcon: IconButton(
                                            icon: const Icon(
                                              Icons.schedule,
                                              color: AppColor.grey,
                                            ),
                                            onPressed: () async {
                                              controller.setEndTime(context);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightScreen / 70),
                                child: const CustomText(text: "Remind"),
                              ),
                              CustomTextFormField(
                                  isReadOnly: true,
                                  hint:
                                      "${controller.selectedRemind} minute Early",
                                  controller: controller.remind,
                                  suffixIcon: CustomDropDownButton(
                                    controller.remindList,
                                    (value) {
                                      controller.setRemind(value);
                                      print("value==================$value");
                                    },
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: heightScreen / 70),
                                child: const CustomText(text: "Repeat"),
                              ),
                              CustomTextFormField(
                                  isReadOnly: true,
                                  hint: controller.selectedRepeat,
                                  controller: controller.repeat,
                                  suffixIcon: CustomDropDownButton(
                                    controller.repeatList,
                                    (value) {
                                      controller.setRepeat(value);
                                      print("value==================$value");
                                    },
                                  ))
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: heightScreen / 70,
                        horizontal: widthScreen / 20,
                      ),
                      child: const CustomText(text: "Color"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: widthScreen / 20,
                        left: widthScreen / 20,
                        right: widthScreen / 20,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                  AppColor.colors.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          controller.setColor(index);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: widthScreen / 40),
                                          width: widthScreen / 12,
                                          height: widthScreen / 12,
                                          decoration: BoxDecoration(
                                              color: AppColor.colors[index],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child:
                                              controller.selectedColor == index
                                                  ? const Icon(
                                                      Icons.done,
                                                      color: AppColor.white,
                                                      size: 20,
                                                    )
                                                  : null,
                                        ),
                                      )),
                            ),
                            CustomButton(
                                onPressed: () {
                                  controller.insertData(context);
                                },
                                text: "Create Task")
                          ]),
                    )
                  ]),
                );
              }),
            );
          },
        ));
  }
}
