// To parse this JSON data, do
//
//     final optionsModel = optionsModelFromJson(jsonString);

import 'dart:convert';

OptionsModel optionsModelFromJson(String str) =>
    OptionsModel.fromJson(json.decode(str));

String optionsModelToJson(OptionsModel data) => json.encode(data.toJson());

class OptionsModel {
  final String? status;
  final int? code;
  final String? message;
  final Data? data;

  OptionsModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory OptionsModel.fromJson(Map<String, dynamic> json) => OptionsModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Employee>? employee;
  final List<TaskCategory>? taskCategory;

  Data({
    this.employee,
    this.taskCategory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employee: json["Employee"] == null
            ? []
            : List<Employee>.from(
                json["Employee"]!.map((x) => Employee.fromJson(x))),
        taskCategory: json["TaskCategory"] == null
            ? []
            : List<TaskCategory>.from(
                json["TaskCategory"]!.map((x) => TaskCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Employee": employee == null
            ? []
            : List<dynamic>.from(employee!.map((x) => x.toJson())),
        "TaskCategory": taskCategory == null
            ? []
            : List<dynamic>.from(taskCategory!.map((x) => x.toJson())),
      };
}

class Employee {
  final String? screenFullName;
  final String? employeeId;

  Employee({
    this.screenFullName,
    this.employeeId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        screenFullName: json["EmployeeName"],
        employeeId: json["pkID"],
      );

  Map<String, dynamic> toJson() => {
        "EmployeeName": screenFullName,
        "pkID": employeeId,
      };
}

class TaskCategory {
  final String? pkId;
  final String? taskCategory;

  TaskCategory({
    this.pkId,
    this.taskCategory,
  });

  factory TaskCategory.fromJson(Map<String, dynamic> json) => TaskCategory(
        pkId: json["pkID"],
        taskCategory: json["TaskCategory"],
      );

  Map<String, dynamic> toJson() => {
        "pkID": pkId,
        "TaskCategory": taskCategory,
      };
}
