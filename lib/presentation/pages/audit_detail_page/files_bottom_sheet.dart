import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:customer_app/presentation/pages/audit_detail_page/controller/audit_detail_controller.dart';
import 'package:customer_app/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FilesBottomSheet {
  static void showFilesBottomSheet(
      {required AuditDetailController auditDetailController}) {
    Get.bottomSheet(Container(
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          )),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 100,
                      decoration: BoxDecoration(
                          color: AppColors.textfieldTitleColor,
                          borderRadius: BorderRadius.circular(10)),
                    ).paddingSymmetric(vertical: 10),
                    const Text(
                      Strings.strUploadedFiles,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: FontFamily.interBold, fontSize: 20),
                    ).paddingSymmetric(horizontal: 22, vertical: 10),
                  ],
                ),
              ),
              IconButton(
                  splashColor: AppColors.primaryDarkColor,
                  onPressed: () {
                    Get.close(1);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.only(bottom: 25),
                itemCount: auditDetailController.uploadedFiles.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    launchUrlString(
                        auditDetailController.uploadedFiles[index].docName ??
                            "");
                  },
                  leading: const Icon(
                    Icons.file_copy_rounded,
                  ),
                  subtitle:
                      auditDetailController.uploadedFiles[index].pkId == null
                          ? const Text(
                              Strings.strUploadPending,
                              style: TextStyle(
                                  fontFamily: FontFamily.interRegular,
                                  fontSize: 12),
                            )
                          : null,
                  title: Text(
                    auditDetailController.uploadedFiles[index].docName ?? "",
                    style: TextStyle(
                        fontFamily: FontFamily.interMedium,
                        fontSize: 15,
                        color: AppColors.primaryDarkColor),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_rounded,
                        color: AppColors.primaryDarkColor,
                      )),
                ),
              ),
            ),
          ),
          CommonButton(
                  onTap: () {
                    auditDetailController.pickFiles();
                  },
                  text: Strings.strAdd)
              .paddingSymmetric(horizontal: 25, vertical: 10)
        ],
      ),
    ));
  }
}
