class TaskModel {
  String? id;
  String? title;
  String? note;
  String? color;
  String? date;
  String? starttime;
  String? endtime;
  String? status;
  String? repeat;
  String? remind;

  TaskModel(
      {this.id,
      this.title,
      this.note,
      this.color,
      this.date,
      this.starttime,
      this.endtime,
      this.status,
      this.repeat,
      this.remind});

  // TaskModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   note = json['note'];
  //   color = json['color'];
  //   date = json['date'];
  //   starttime = json['starttime'];
  //   endtime = json['endtime'];
  //   status = json['status'];
  //   repeat = json['repeat'];
  //   remind = json['remind'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['note'] = this.note;
  //   data['color'] = this.color;
  //   data['date'] = this.date;
  //   data['starttime'] = this.starttime;
  //   data['endtime'] = this.endtime;
  //   data['status'] = this.status;
  //   data['repeat'] = this.repeat;
  //   data['remind'] = this.remind;
  //   return data;
  // }
}
