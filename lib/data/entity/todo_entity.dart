// To parse this JSON data, do
//
//     final todoEntity = todoEntityFromJson(jsonString);

import 'dart:convert';

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
  DateTime? updatedDate;
  String? longitude;
  String? latitude;
  String? closingRemarks;
  int? customerId;
  DateTime? actualDeliveryDate;

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
    this.updatedDate,
    this.longitude,
    this.latitude,
    this.closingRemarks,
    this.customerId,
    this.actualDeliveryDate,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
        id: json["ID"],
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
        updatedBy: json["UpdatedBy"],
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
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
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
        "UpdatedBy": updatedBy,
        "UpdatedDate": updatedDate?.toIso8601String(),
        "Longitude": longitude,
        "Latitude": latitude,
        "ClosingRemarks": closingRemarks,
        "CustomerID": customerId,
        "ActualDeliveryDate": actualDeliveryDate?.toIso8601String(),
      };
}
