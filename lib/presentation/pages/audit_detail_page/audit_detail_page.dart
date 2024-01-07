import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:customer_app/presentation/pages/audit_detail_page/controller/audit_detail_controller.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuditDetailPage extends GetView<AuditDetailController> {
  const AuditDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: Strings.strAuditDetail, context: context),
      body: ListView.separated(
        itemCount: controller.sections!.length,
        itemBuilder: (context, index) {
          var data = controller.sections![index];
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
                          value: data.selected!.value,
                          onChanged: (value) {
                            data.selected!.value = value!;
                          },
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
    );
  }
}
