// To parse this JSON data, do
//
//     final todoCreateModel = todoCreateModelFromJson(jsonString);

import 'dart:convert';

TodoCreateModel todoCreateModelFromJson(String str) =>
    TodoCreateModel.fromJson(json.decode(str));

String todoCreateModelToJson(TodoCreateModel data) =>
    json.encode(data.toJson());

class TodoCreateModel {
  String? status;
  int? code;
  String? message;
  String? data;

  TodoCreateModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory TodoCreateModel.fromJson(Map<String, dynamic> json) =>
      TodoCreateModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data,
      };
}
