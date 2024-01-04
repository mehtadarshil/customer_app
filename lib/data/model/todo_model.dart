// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  final String? status;
  final int? code;
  final String? message;
  final List<Datum>? data;

  TodoModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? pkId;
  final String? taskDescription;
  final String? taskCategoryId;
  final String? location;
  final String? priority;
  final DateTime? startDate;
  final DateTime? dueDate;
  final DateTime? deliveryDate;
  final DateTime? completionDate;
  final String? employeeId;
  final bool? reminder;
  final String? reminderMonth;
  final String? createdBy;
  final DateTime? createdDate;
  final String? updatedBy;
  final DateTime? updatedDate;
  final String? longitude;
  final String? latitude;
  final String? closingRemarks;
  final String? customerId;
  final String? employeeName;
  final DateTime? actualDeliveryDate;

  Datum({
    this.pkId,
    this.taskDescription,
    this.taskCategoryId,
    this.location,
    this.priority,
    this.startDate,
    this.dueDate,
    this.deliveryDate,
    this.completionDate,
    this.employeeId,
    this.reminder,
    this.reminderMonth,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.longitude,
    this.latitude,
    this.closingRemarks,
    this.customerId,
    this.employeeName,
    this.actualDeliveryDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pkId: json["pkID"],
        taskDescription: json["TaskDescription"],
        taskCategoryId: json["TaskCategoryId"],
        location: json["Location"],
        priority: json["Priority"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        dueDate:
            json["DueDate"] == null ? null : DateTime.parse(json["DueDate"]),
        deliveryDate: json["DeliveryDate"] == null
            ? null
            : DateTime.parse(json["DeliveryDate"]),
        completionDate: json["CompletionDate"] == null
            ? null
            : DateTime.parse(json["CompletionDate"]),
        employeeId: json["EmployeeID"],
        reminder: json["Reminder"],
        reminderMonth: json["ReminderMonth"],
        createdBy: json["CreatedBy"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        updatedBy: json["UpdatedBy"],
        updatedDate: json["UpdatedDate"] == null
            ? null
            : DateTime.parse(json["UpdatedDate"]),
        longitude: json["Longitude"],
        latitude: json["Latitude"],
        closingRemarks: json["ClosingRemarks"],
        employeeName: json["EmployeeName"],
        customerId: json["CustomerID"],
        actualDeliveryDate: json["ActualDeliveryDate"] == null
            ? null
            : DateTime.parse(json["ActualDeliveryDate"]),
      );

  Map<String, dynamic> toJson() => {
        "pkID": pkId,
        "TaskDescription": taskDescription,
        "TaskCategoryId": taskCategoryId,
        "Location": location,
        "Priority": priority,
        "StartDate": startDate?.toIso8601String(),
        "DueDate": dueDate?.toIso8601String(),
        "DeliveryDate": deliveryDate?.toIso8601String(),
        "CompletionDate": completionDate?.toIso8601String(),
        "EmployeeID": employeeId,
        "Reminder": reminder,
        "ReminderMonth": reminderMonth,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate?.toIso8601String(),
        "UpdatedBy": updatedBy,
        "UpdatedDate": updatedDate?.toIso8601String(),
        "Longitude": longitude,
        "Latitude": latitude,
        "ClosingRemarks": closingRemarks,
        "EmployeeName": employeeName,
        "CustomerID": customerId,
        "ActualDeliveryDate": actualDeliveryDate?.toIso8601String(),
      };
}
