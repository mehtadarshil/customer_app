// To parse this JSON data, do
//
//     final todoEntity = todoEntityFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

TodoEntity todoEntityFromJson(String str) =>
    TodoEntity.fromJson(json.decode(str));

String todoEntityToJson(TodoEntity data) => json.encode(data.toJson());

class TodoEntity {
  int? id;
  String? taskDescription;
  int? taskCategoryId;
  String? location;
  String? priority;
  DateTime? startDate;
  DateTime? dueDate;
  DateTime? deliveryDate;
  DateTime? completionDate;
  int? employeeId;
  int? reminder;
  int? reminderMonth;
  String? createdBy;
  String? updatedBy;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? longitude;
  String? latitude;
  String? closingRemarks;
  int? customerId;
  DateTime? actualDeliveryDate;
  List<int>? multiAssignEmp;

  TodoEntity({
    this.id,
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
    this.updatedBy,
    this.createdDate,
    this.updatedDate,
    this.longitude,
    this.latitude,
    this.closingRemarks,
    this.customerId,
    this.actualDeliveryDate,
    this.multiAssignEmp,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
      id: json["ID"],
      taskDescription: json["TaskDescription"],
      taskCategoryId: json["TaskCategoryId"],
      location: json["Location"],
      priority: json["Priority"],
      startDate:
          json["StartDate"] == null ? null : DateTime.parse(json["StartDate"]),
      dueDate: json["DueDate"] == null ? null : DateTime.parse(json["DueDate"]),
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
      updatedBy: json["UpdatedBy"],
      createdDate: json["CreatedDate"] == null
          ? null
          : DateTime.parse(json["CreatedDate"]),
      updatedDate: json["UpdatedDate"] == null
          ? null
          : DateTime.parse(json["UpdatedDate"]),
      longitude: json["Longitude"],
      latitude: json["Latitude"],
      closingRemarks: json["ClosingRemarks"],
      customerId: json["CustomerID"],
      actualDeliveryDate: json["ActualDeliveryDate"] == null
          ? null
          : DateTime.parse(json["ActualDeliveryDate"]),
      multiAssignEmp: json["MultiAssignEmp"] == null
          ? []
          : List<int>.from(json["MultiAssignEmp"]!.map((x) => x)));

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TaskDescription": taskDescription,
        "TaskCategoryId": taskCategoryId,
        "Location": location,
        "Priority": priority,
        "StartDate": startDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(startDate!)
            : "",
        "DueDate": dueDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(dueDate!)
            : "",
        "DeliveryDate": deliveryDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(deliveryDate!)
            : "",
        "CompletionDate": completionDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(completionDate!)
            : "",
        "EmployeeID": employeeId,
        "Reminder": reminder,
        "ReminderMonth": reminderMonth,
        "CreatedBy": createdBy,
        "UpdatedBy": updatedBy,
        "CreatedDate": createdDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(createdDate!)
            : "",
        "UpdatedDate": updatedDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(updatedDate!)
            : "",
        "Longitude": longitude,
        "Latitude": latitude,
        "ClosingRemarks": closingRemarks,
        "CustomerID": customerId,
        "ActualDeliveryDate": actualDeliveryDate != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(actualDeliveryDate!)
            : "",
        "MultiAssignEmp": multiAssignEmp == null
            ? []
            : List<dynamic>.from(multiAssignEmp!.map((x) => x)),
      };
}
