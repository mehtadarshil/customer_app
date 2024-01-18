import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/data/entity/audit_edit_entity.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:customer_app/presentation/pages/audit_detail_page/controller/audit_detail_controller.dart';
import 'package:customer_app/presentation/pages/audit_detail_page/files_bottom_sheet.dart';
import 'package:customer_app/presentation/widgets/common-dropdown.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:customer_app/presentation/widgets/common_button.dart';
import 'package:customer_app/presentation/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuditDetailPage extends GetView<AuditDetailController> {
  const AuditDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
          title: controller.auditWithCustomer?.customerName ??
              Strings.strAuditDetail,
          context: context),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.sections.length,
          itemBuilder: (context, index) {
            var data = controller.sections[index];
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ]),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.inquiryStatus ?? "",
                    style: const TextStyle(
                        fontFamily: FontFamily.interSemiBold, fontSize: 15),
                  ),
                  Text(
                    data.description ?? "",
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 12),
                  ),
                  Divider(
                    color: AppColors.primaryDarkColor,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: data.selected!.value,
                            activeColor: AppColors.primaryDarkColor,
                            onChanged: (value) {
                              data.selected!.value = value!;
                            },
                          )),
                      Expanded(
                          flex: 40,
                          child: Obx(
                            () => CommonDropdown(
                              hintText: Strings.score,
                              items: List.generate(
                                      int.parse(data.baseRating!) + 1,
                                      (index) => index)
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              isDense: true,
                              onChanged: (newValue) {
                                data.score!.value = newValue as int;
                              },
                              value: data.score!.value,
                            ),
                          )),
                      Text(
                        " / ${data.baseRating}",
                        style: const TextStyle(
                            fontFamily: FontFamily.interRegular, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 70,
                          child: SizedBox(
                            height: 30,
                            child: CommonTextfield(
                              controller: data.remarkController!,
                              isDense: true,
                              hintText: Strings.strReamrk,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            );
          },
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: CommonButton(
                      onTap: () {
                        FilesBottomSheet.showFilesBottomSheet(
                            auditDetailController: controller);
                      },
                      isLight: true,
                      text: "Add Files")
                  .paddingOnly(top: 10, bottom: 10, left: 22)),
          Expanded(
            child: CommonButton(
                    onTap: () {
                      List<CheckList> finalChecklist = [];
                      for (var element in controller.sections) {
                        finalChecklist.add(CheckList(
                          checkListId: int.parse(element.checkListId!),
                          auditStatus: element.selected!.value ? 1 : 0,
                          remark: element.remarkController!.text,
                          scoreRating: element.score!.value,
                        ));
                      }
                      controller.editAudit(
                        AuditEditEntity(
                            parentId: int.tryParse(
                                controller.auditWithCustomer?.pkId ?? ""),
                            checkList: finalChecklist),
                      );
                    },
                    text: Strings.strSave)
                .paddingSymmetric(horizontal: 22, vertical: 10),
          ),
        ],
      ),
    );
  }
}
