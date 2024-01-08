// To parse this JSON data, do
//
//     final auditSectionModel = auditSectionModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

AuditSectionModel auditSectionModelFromJson(String str) =>
    AuditSectionModel.fromJson(json.decode(str));

String auditSectionModelToJson(AuditSectionModel data) =>
    json.encode(data.toJson());

class AuditSectionModel {
  final String? status;
  final int? code;
  final String? message;
  final List<Section>? data;

  AuditSectionModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AuditSectionModel.fromJson(Map<String, dynamic> json) =>
      AuditSectionModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Section>.from(json["data"]!.map((x) => Section.fromJson(x))),
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

class Section {
  final String? pkId;
  final String? inquiryStatus;
  final String? statusCategory;
  final dynamic campaignId;
  final String? displayOrder;
  final String? baseRating;
  final String? description;
  final String? checkListId;
  RxBool? selected;
  TextEditingController? remarkController;
  RxInt? score;

  Section(
      {this.pkId,
      this.inquiryStatus,
      this.statusCategory,
      this.campaignId,
      this.displayOrder,
      this.baseRating,
      this.description,
      this.checkListId,
      this.selected,
      this.remarkController,
      this.score});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
      pkId: json["pkID"],
      inquiryStatus: json["InquiryStatus"],
      statusCategory: json["StatusCategory"],
      campaignId: json["CampaignID"],
      displayOrder: json["DisplayOrder"],
      baseRating: json["BaseRating"],
      description: json["Description"],
      checkListId: json["checkListID"],
      selected: false.obs,
      remarkController: TextEditingController(),
      score: 0.obs);

  Map<String, dynamic> toJson() => {
        "pkID": pkId,
        "InquiryStatus": inquiryStatus,
        "StatusCategory": statusCategory,
        "CampaignID": campaignId,
        "DisplayOrder": displayOrder,
        "BaseRating": baseRating,
        "Description": description,
        "checkListID": checkListId,
      };
}
