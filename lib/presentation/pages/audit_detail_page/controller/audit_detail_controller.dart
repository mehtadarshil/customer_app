import 'dart:io';

import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/entity/audit_edit_entity.dart';
import 'package:customer_app/data/model/audit_activity_model.dart';
import 'package:customer_app/data/model/audit_section_model.dart';
import 'package:customer_app/data/model/options_model.dart';
import 'package:customer_app/presentation/pages/audit_page/controller/audit_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuditDetailController extends GetxController {
  final AuditWithCustomer? auditWithCustomer =
      Get.arguments["auditWithCustomer"];
  final RxList<Section> sections = <Section>[].obs;

  final ApiClient _apiClient = Get.find();
  final AuditController _auditController = Get.find();

  RxList<PlatformFile> pickedFiles = <PlatformFile>[].obs;

  @override
  void onReady() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getSections();
    });
    super.onReady();
  }

  void pickFiles() async {
    var data = await FilePicker.platform.pickFiles();
    if (data != null) {
      // pickedFiles.addAll(data.files);
      var request =
          http.MultipartRequest("POST", Uri.parse("${ApiConst.baseUrl}upload"));
      request.files.add(http.MultipartFile.fromBytes(
          "file", await File(data.files.first.path!).readAsBytes(),
          filename: data.files.first.name));
      request.send().then((response) {
        print("Uploaded! ${response.statusCode}");
      });
    }
  }

  void getSections() async {
    try {
      var tempData = await _apiClient.get(path: ApiConst.auditSection);
      if (tempData != null) {
        sections.value = AuditSectionModel.fromJson(tempData).data ?? [];
        if (sections.isNotEmpty) {
          for (var element in sections) {
            var findElement = auditWithCustomer?.score?.firstWhere(
              (ele) => ele.checkListId == element.checkListId,
              orElse: () => Score(checkListId: null),
            );
            if (findElement?.checkListId != null) {
              element.score!.value =
                  int.tryParse(findElement?.scoreRating ?? "") ?? 0;
              element.remarkController!.text = findElement?.remarks ?? "";
              element.selected!.value = findElement?.auditStatus ?? false;
            }
          }
        }
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }

  void editAudit(AuditEditEntity data) async {
    try {
      var tempData = await _apiClient.post(
          path: ApiConst.editAuditActivity, body: data.toJson());
      if (tempData != null) {
        Get.close(1);
        _auditController.getAuditActivityList();
        SnackBarUtil.showSnackBar(
            message: OptionsModel.fromJson(tempData).message ?? "");
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }
}
