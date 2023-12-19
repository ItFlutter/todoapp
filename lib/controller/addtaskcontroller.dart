import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/homepage_controller.dart';
import 'package:to_do_app/core/class/notificationapi.dart';
import 'package:to_do_app/core/class/sqldb.dart';
import 'package:to_do_app/core/class/statuscode.dart';
import 'package:timezone/timezone.dart' as tz;

class AddTaskController extends GetxController {
  NotificationApi notificationApi = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  SqlDb sqlDb = Get.find();
  List<int> remindList = [5, 10, 15, 20];
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  int selectedRemind = 5;
  String selectedRepeat = "None";
  late TextEditingController title;
  late TextEditingController note;
  late TextEditingController dateController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  late TextEditingController remind;
  late TextEditingController repeat;
  DateTime? sechudleDate;
  int selectedColor = 0;
  TimeOfDay startTime = TimeOfDay.now();
  late TimeOfDay endTime;

  DateTime date = DateTime.now();
  setDate(context) async {
    date = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime.now(),
            lastDate: DateTime(2031)) ??
        DateTime.now();
    print(date.toString().substring(0, 10));

    update();
  }

  onRefresh() {
    statusRequest = StatusRequest.none;
    update();
  }

  setColor(index) {
    selectedColor = index;
    print("selectedColor==================$selectedColor");

    update();
  }

  setRemind(value) {
    selectedRemind = value;
    print("selectedRemind==================$selectedRemind");
    update();
  }

  setRepeat(value) {
    selectedRepeat = value;
    print("selectedRepeat==================$selectedRepeat");
    update();
  }

  setStartTime(context) async {
    startTime = await showTimePicker(
            context: context,
            initialTime: startTime,
            initialEntryMode: TimePickerEntryMode.input) ??
        TimeOfDay.now();
    print(startTime.format(context));
    update();
  }

  setEndTime(context) async {
    endTime = await showTimePicker(
            context: context,
            initialTime: endTime,
            initialEntryMode: TimePickerEntryMode.input) ??
        TimeOfDay.now();
    print(endTime.format(context));

    update();
  }

  insertData(context) async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      // await sqlDb.insertData(
      //     'insert into todo(title,note,color,date,starttime,endtime,status,repeat,remind) values ("titletest","notetest",0,"2023/12/5","09:00","09:10","TODO","20","Monthly")');
      int response = await sqlDb.insertData(
          'insert into todo(title,note,color,date,starttime,endtime,status,repeat,remind) values ("${title.text}","${note.text}","$selectedColor","${date.toString().substring(0, 10)}","${startTime.format(context)}","${endTime.format(context)}","TODO","$selectedRepeat","$selectedRemind")');
      print(
          "================================Response===========================$response");
      if (response > 0) {
        List<Map> id = await sqlDb.readData(
            "select id from todo where id =(select max(id) from todo)");
        // print("====================================================");
        // print(id[0]['id'].runtimeType);
        if (selectedRepeat == "None") {
          print("ScheduleOnTime=============================================");
          sechudleDate = DateTime(
              date.year,
              date.month,
              date.day,
              startTime.hour,
              startTime.minute,
              date.second,
              date.millisecond,
              date.microsecond);
          sechudleDate =
              sechudleDate!.subtract(Duration(minutes: selectedRemind));

          if (sechudleDate!.isBefore(DateTime.now())) {
            print("The Selected Date Before Now");
            sechudleDate = sechudleDate!.add(const Duration(days: 1));
          }
          // sechudleDate!.isBefore(DateTime.now())
          //     ? sechudleDate!.add(const Duration(days: 1))
          //     : sechudleDate;
          await notificationApi.scheduleNotification(
              id[0]['id'],
              title.text,
              note.text,
              sechudleDate!,
              "${title.text},${note.text},${sechudleDate!.hour},${sechudleDate!.minute}");
          print(sechudleDate);
        }
        if (selectedRepeat == "Daily") {
          sechudleDate = DateTime(
              date.year,
              date.month,
              date.day,
              startTime.hour,
              startTime.minute,
              date.second,
              date.millisecond,
              date.microsecond);
          sechudleDate =
              sechudleDate!.subtract(Duration(minutes: selectedRemind));

          if (sechudleDate!.isBefore(DateTime.now())) {
            print("The Selected Date Before Now");
            sechudleDate = sechudleDate!.add(const Duration(days: 1));
          }

          print("ScheduleOnDaily=============================================");
          print(sechudleDate);
          notificationApi.scheduleNotificationDaily(
              id[0]['id'],
              title.text,
              note.text,
              sechudleDate!.year,
              sechudleDate!.month,
              sechudleDate!.day,
              sechudleDate!.hour,
              sechudleDate!.minute,
              sechudleDate!.second,
              sechudleDate!.millisecond,
              sechudleDate!.microsecond,
              "${title.text},${note.text},${sechudleDate!.hour},${sechudleDate!.minute}");
        }
        if (selectedRepeat == "Weekly") {
          sechudleDate = DateTime(
              date.year,
              date.month,
              date.day,
              startTime.hour,
              startTime.minute,
              date.second,
              date.millisecond,
              date.microsecond);
          sechudleDate =
              sechudleDate!.subtract(Duration(minutes: selectedRemind));

          if (sechudleDate!.isBefore(DateTime.now())) {
            print("The Selected Date Before Now");
            sechudleDate = sechudleDate!.add(const Duration(days: 1));
          }

          print(
              "ScheduleOnWeeekly=============================================");
          print(sechudleDate);
          notificationApi.scheduleNotificationWeekly(
              id[0]['id'],
              title.text,
              note.text,
              sechudleDate!.year,
              sechudleDate!.month,
              sechudleDate!.day,
              sechudleDate!.hour,
              sechudleDate!.minute,
              sechudleDate!.second,
              sechudleDate!.millisecond,
              sechudleDate!.microsecond,
              "${title.text},${note.text},${sechudleDate!.hour},${sechudleDate!.minute}");
        }
        if (selectedRepeat == "Monthly") {
          sechudleDate = DateTime(
              date.year,
              date.month,
              date.day,
              startTime.hour,
              startTime.minute,
              date.second,
              date.millisecond,
              date.microsecond);
          sechudleDate =
              sechudleDate!.subtract(Duration(minutes: selectedRemind));
          if (sechudleDate!.isBefore(DateTime.now())) {
            print("The Selected Date Before Now");
            sechudleDate = sechudleDate!.add(const Duration(days: 1));
          }

          print(
              "ScheduleOnMonthly=============================================");
          print(sechudleDate);
          notificationApi.scheduleNotificationMonthly(
              id[0]['id'],
              title.text,
              note.text,
              sechudleDate!.year,
              sechudleDate!.month,
              sechudleDate!.day,
              sechudleDate!.hour,
              sechudleDate!.minute,
              sechudleDate!.second,
              sechudleDate!.millisecond,
              sechudleDate!.microsecond,
              "${title.text},${note.text},${sechudleDate!.hour},${sechudleDate!.minute}");
        }
        HomePageController homePageController = Get.find();
        homePageController.getData();
        Get.back();
      } else {
        Get.defaultDialog(
            title: "Warning", content: const Text("Something Went Wrong"));
      }
      statusRequest = StatusRequest.none;
      update();
    }
  }

  @override
  void onInit() {
    // print(date.toString().substring(0, 10));
    // print(startTime);

    // endTime =
    //     startTime.value.replacing(minute: startTime.value.minute + 15).obs;
    endTime =
        TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 15)));
    // print(endTime);
    title = TextEditingController();
    note = TextEditingController();
    dateController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    remind = TextEditingController();
    repeat = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
