// To parse this JSON data, do
//
//     final customerListEntity = customerListEntityFromJson(jsonString);

import 'dart:convert';

CustomerListEntity customerListEntityFromJson(String str) =>
    CustomerListEntity.fromJson(json.decode(str));

String customerListEntityToJson(CustomerListEntity data) =>
    json.encode(data.toJson());

class CustomerListEntity {
  final String? loginUserId;
  final String? companyId;
  final bool? listMode;

  CustomerListEntity({
    this.loginUserId,
    this.companyId,
    this.listMode,
  });

  factory CustomerListEntity.fromJson(Map<String, dynamic> json) =>
      CustomerListEntity(
        loginUserId: json["LoginUserID"],
        companyId: json["CompanyId"],
        listMode: json["ListMode"],
      );

  Map<String, dynamic> toJson() => {
        "LoginUserID": loginUserId,
        "CompanyId": companyId,
        "ListMode": listMode,
      };
}
