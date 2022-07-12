import 'data_model.dart';

class Employee {

  late String status;
  late List<Data> data;
  late String message;

  Employee(this.status, this.data, this.message,);

  Employee.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}