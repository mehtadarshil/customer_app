// To parse this JSON data, do
//
//     final auditEditEntity = auditEditEntityFromJson(jsonString);

import 'dart:convert';

AuditEditEntity auditEditEntityFromJson(String str) =>
    AuditEditEntity.fromJson(json.decode(str));

String auditEditEntityToJson(AuditEditEntity data) =>
    json.encode(data.toJson());

class AuditEditEntity {
  final int? parentId;
  final List<CheckList>? checkList;

  AuditEditEntity({
    this.parentId,
    this.checkList,
  });

  factory AuditEditEntity.fromJson(Map<String, dynamic> json) =>
      AuditEditEntity(
        parentId: json["ParentId"],
        checkList: json["CheckList"] == null
            ? []
            : List<CheckList>.from(
                json["CheckList"]!.map((x) => CheckList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ParentId": parentId,
        "CheckList": checkList == null
            ? []
            : List<dynamic>.from(checkList!.map((x) => x.toJson())),
      };
}

class CheckList {
  final int? checkListId;
  final int? auditStatus;
  final int? scoreRating;
  final String? remark;

  CheckList({
    this.checkListId,
    this.auditStatus,
    this.scoreRating,
    this.remark,
  });

  factory CheckList.fromJson(Map<String, dynamic> json) => CheckList(
        checkListId: json["CheckListID"],
        auditStatus: json["AuditStatus"],
        scoreRating: json["ScoreRating"],
        remark: json["Remark"],
      );

  Map<String, dynamic> toJson() => {
        "CheckListID": checkListId,
        "AuditStatus": auditStatus,
        "ScoreRating": scoreRating,
        "Remark": remark,
      };
}
