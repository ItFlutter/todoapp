import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/class/sqldb.dart';
import 'package:to_do_app/core/class/statuscode.dart';
import 'package:to_do_app/core/constant/app_theme.dart';
import 'package:to_do_app/core/constant/color.dart';
import 'package:to_do_app/core/sevices/sevices.dart';
import 'package:to_do_app/data/model/taskmodel.dart';
import 'dart:math';

class HomePageController extends GetxController {
  MyServices myServices = Get.find();
  DateTime selectedDateTime = DateTime.now();
  StatusRequest statusRequest = StatusRequest.none;
  // late GlobalKey containerKey;
  SqlDb sqlDb = Get.find();
  List<TaskModel> task = [];
  // addWeekly() {
  //   DateTime dateTime = DateTime.now().add(Duration(days: 24));
  //   print(
  //       "===================================================dateTime $dateTime");
  //   // print(
  //   // "===================================================localDateTime${dateTime.toLocal()}");
  //   // print(dateTime.toLocal());
  //   // print(double.infinity);
  //   // for (int i = 0; i < double.infinity; i + 7) {
  //   //   print(i);
  //   // }
  //   // DateTime().add(Duration(days: pow(7,double.infinity).toInt()));
  // }
  changeMode() {
    if (Get.isDarkMode) {
      print("====================================================DarkMode");
      Get.changeTheme(themeLight);
      myServices.sharedPreferences.setString("theme", "light");
    } else {
      print("====================================================LightMode");

      Get.changeTheme(themeDark);
      myServices.sharedPreferences.setString("theme", "dark");
    }
    update();
  }

  getData() async {
    task.clear();
    statusRequest = StatusRequest.loading;
    update();
    List<Map> data = await sqlDb.readData('select * from todo');
    data.forEach((element) {
      // pow(7, infinity);

      if (element['repeat'] == 'Daily' &&
          !DateTime.parse(selectedDateTime.toString().substring(0, 10))
              .isBefore(DateTime.parse(element['date']))) {
        print("==============================If_Daily");

        task.add(TaskModel(
          id: element['id'].toString(),
          color: element['color'].toString(),
          date: element['date'],
          endtime: element['endtime'],
          starttime: element['starttime'],
          note: element['note'],
          remind: element['remind'],
          repeat: element['repeat'],
          status: element['status'],
          title: element['title'],
        ));
      }

      if (element['repeat'] == 'None' &&
          element['date'] ==
              "${selectedDateTime.toString().substring(0, 10)}") {
        print("==============================If_None");

        task.add(TaskModel(
          id: element['id'].toString(),
          color: element['color'].toString(),
          date: element['date'],
          endtime: element['endtime'],
          starttime: element['starttime'],
          note: element['note'],
          remind: element['remind'],
          repeat: element['repeat'],
          status: element['status'],
          title: element['title'],
        ));
      }
      if (element['repeat'] == 'Monthly' &&
          !DateTime.parse(selectedDateTime.toString().substring(0, 10))
              .isBefore(DateTime.parse(element['date'])) &&
          selectedDateTime.toString().substring(8, 10) ==
              element['date'].substring(8, 10)) {
        print("==============================If_Monthly");

        task.add(TaskModel(
          id: element['id'].toString(),
          color: element['color'].toString(),
          date: element['date'],
          endtime: element['endtime'],
          starttime: element['starttime'],
          note: element['note'],
          remind: element['remind'],
          repeat: element['repeat'],
          status: element['status'],
          title: element['title'],
        ));
      }
      if (element['repeat'] == 'Weekly' &&
          !DateTime.parse(selectedDateTime.toString().substring(0, 10))
              .isBefore(DateTime.parse(element['date'])) &&
          DateTime.parse(selectedDateTime.toString().substring(0, 10))
                      .difference(DateTime.parse(element['date']))
                      .inDays %
                  7 ==
              0) {
        print("==============================If_Weekly");

        task.add(TaskModel(
          id: element['id'].toString(),
          color: element['color'].toString(),
          date: element['date'],
          endtime: element['endtime'],
          starttime: element['starttime'],
          note: element['note'],
          remind: element['remind'],
          repeat: element['repeat'],
          status: element['status'],
          title: element['title'],
        ));
      }
    });
    // task.addAll(data.map((e) => TaskModel(
    //       id: e['id'].toString(),
    //       color: e['color'].toString(),
    //       date: e['date'],
    //       endtime: e['endtime'],
    //       starttime: e['starttime'],
    //       note: e['note'],
    //       remind: e['remind'],
    //       repeat: e['repeat'],
    //       status: e['status'],
    //       title: e['title'],
    //     )));
    print(
        "==============================data============================$data");
    print(
        "==============================task============================$task");
    // print(task);
    statusRequest = StatusRequest.none;
    update();
  }

  completeTask(String id) async {
    statusRequest = StatusRequest.loading;
    update();

    int response = await sqlDb
        .updateData("update todo set status='Completed' where id=$id");
    print(
        "================================Response===========================$response");
    if (response > 0) {
      await myServices.flutterLocalNotificationsPlugin.cancel(int.parse(id));

      task[task.indexWhere((element) => element.id == id)].status = "Completed";
      // getData();
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    update();
    print("Complete Task");
  }

  onRefresh() {
    statusRequest = StatusRequest.none;
    update();
  }

  deleteAllData() async {
    statusRequest = StatusRequest.loading;
    update();
    int response = await sqlDb.deleteData("delete from todo");
    print(
        "================================Response===========================$response");
    if (response > 0) {
      task.clear();
      print(task);
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("All tasks have been removed"));
    }

    statusRequest = StatusRequest.none;
    update();
  }

  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    int response = await sqlDb.deleteData("delete from todo where id=$id");
    print(
        "================================Response===========================$response");
    if (response > 0) {
      await myServices.flutterLocalNotificationsPlugin.cancel(int.parse(id));
      task.removeWhere(
        (element) => element.id == id,
      );
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }

    statusRequest = StatusRequest.none;
    update();
    print("DELETE Task");
  }

  setColor(int index) {
    return AppColor.colors[index];
  }

  @override
  void onInit() {
    // addWeekly();
    // containerKey = GlobalKey();
    getData();
    // Future.delayed(Duration(seconds: 2), () {
    //   widgetHeight =
    //       containerKey.currentContext?.findRenderObject() as RenderBox;
    //   print(widgetHeight!.size.height);
    // });
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   print("SchedulerBinding");
    // });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("WidgetsBinding");
    // });

    // TODO: implement onInit
    super.onInit();
  }
}
