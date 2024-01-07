// To parse this JSON data, do
//
//     final auditActivityModel = auditActivityModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

AuditActivityModel auditActivityModelFromJson(String str) =>
    AuditActivityModel.fromJson(json.decode(str));

String auditActivityModelToJson(AuditActivityModel data) =>
    json.encode(data.toJson());

class AuditActivityModel {
  final String? status;
  final int? code;
  final String? message;
  final Data? data;

  AuditActivityModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AuditActivityModel.fromJson(Map<String, dynamic> json) =>
      AuditActivityModel(
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
  final List<AuditWithCustomer>? auditWithCustomer;
  final List<Section>? section;

  Data({
    this.auditWithCustomer,
    this.section,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        auditWithCustomer: json["auditWithCustomer"] == null
            ? []
            : List<AuditWithCustomer>.from(json["auditWithCustomer"]!
                .map((x) => AuditWithCustomer.fromJson(x))),
        section: json["section"] == null
            ? []
            : List<Section>.from(
                json["section"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "auditWithCustomer": auditWithCustomer == null
            ? []
            : List<dynamic>.from(auditWithCustomer!.map((x) => x.toJson())),
        "section": section == null
            ? []
            : List<dynamic>.from(section!.map((x) => x.toJson())),
      };
}

class AuditWithCustomer {
  final String? pkId;
  final DateTime? auditDate;
  final String? customerId;
  final String? employeeId;
  final String? baseRating;
  final String? scoreRating;
  final int? auditScore;
  final dynamic timeIn;
  final dynamic timeOut;
  final dynamic latitudeIn;
  final dynamic longitudeIn;
  final dynamic latitudeOut;
  final dynamic longitudeOut;
  final dynamic locationAddressIn;
  final dynamic locationAddressOut;
  final String? createdBy;
  final DateTime? createdDate;
  final String? updatedBy;
  final DateTime? updatedDate;
  final String? auditStatus;
  final String? customerName;
  final String? contactNo1;
  final String? area;
  final String? employeeName;
  final String? city;

  AuditWithCustomer({
    this.pkId,
    this.auditDate,
    this.customerId,
    this.employeeId,
    this.baseRating,
    this.scoreRating,
    this.auditScore,
    this.timeIn,
    this.timeOut,
    this.latitudeIn,
    this.longitudeIn,
    this.latitudeOut,
    this.longitudeOut,
    this.locationAddressIn,
    this.locationAddressOut,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.auditStatus,
    this.customerName,
    this.contactNo1,
    this.area,
    this.employeeName,
    this.city,
  });

  factory AuditWithCustomer.fromJson(Map<String, dynamic> json) =>
      AuditWithCustomer(
        pkId: json["pkID"],
        auditDate: json["AuditDate"] == null
            ? null
            : DateTime.parse(json["AuditDate"]),
        customerId: json["CustomerID"],
        employeeId: json["EmployeeID"],
        baseRating: json["BaseRating"],
        scoreRating: json["ScoreRating"],
        auditScore: json["AuditScore"],
        timeIn: json["TimeIn"],
        timeOut: json["TimeOut"],
        latitudeIn: json["Latitude_IN"],
        longitudeIn: json["Longitude_IN"],
        latitudeOut: json["Latitude_OUT"],
        longitudeOut: json["Longitude_OUT"],
        locationAddressIn: json["LocationAddress_IN"],
        locationAddressOut: json["LocationAddress_OUT"],
        createdBy: json["CreatedBy"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        updatedBy: json["UpdatedBy"],
        updatedDate: json["UpdatedDate"] == null
            ? null
            : DateTime.parse(json["UpdatedDate"]),
        auditStatus: json["AuditStatus"],
        customerName: json["CustomerName"],
        contactNo1: json["ContactNo1"],
        area: json["Area"],
        employeeName: json["EmployeeName"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "pkID": pkId,
        "AuditDate": auditDate?.toIso8601String(),
        "CustomerID": customerId,
        "EmployeeID": employeeId,
        "BaseRating": baseRating,
        "ScoreRating": scoreRating,
        "AuditScore": auditScore,
        "TimeIn": timeIn,
        "TimeOut": timeOut,
        "Latitude_IN": latitudeIn,
        "Longitude_IN": longitudeIn,
        "Latitude_OUT": latitudeOut,
        "Longitude_OUT": longitudeOut,
        "LocationAddress_IN": locationAddressIn,
        "LocationAddress_OUT": locationAddressOut,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate?.toIso8601String(),
        "UpdatedBy": updatedBy,
        "UpdatedDate": updatedDate?.toIso8601String(),
        "AuditStatus": auditStatus,
        "CustomerName": customerName,
        "ContactNo1": contactNo1,
        "Area": area,
        "EmployeeName": employeeName,
        "city": city,
      };
}

class Section {
  final String? pkId;
  final String? inquiryStatus;
  final String? statusCategory;
  final dynamic campaignId;
  final String? displayOrder;
  final String? baseRating;
  final String? description;
  RxBool? selected;

  Section({
    this.pkId,
    this.inquiryStatus,
    this.statusCategory,
    this.campaignId,
    this.displayOrder,
    this.baseRating,
    this.description,
    this.selected,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
      pkId: json["pkID"],
      inquiryStatus: json["InquiryStatus"],
      statusCategory: json["StatusCategory"],
      campaignId: json["CampaignID"],
      displayOrder: json["DisplayOrder"],
      baseRating: json["BaseRating"],
      description: json["Description"],
      selected: false.obs);

  Map<String, dynamic> toJson() => {
        "pkID": pkId,
        "InquiryStatus": inquiryStatus,
        "StatusCategory": statusCategory,
        "CampaignID": campaignId,
        "DisplayOrder": displayOrder,
        "BaseRating": baseRating,
        "Description": description,
      };
}
