import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/routes/route_const.dart';
import 'package:customer_app/presentation/pages/audit_page/controller/audit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/audit_card.dart';

class AuditPage extends GetView<AuditController> {
  const AuditPage({super.key});

  @override
  AuditController get controller => Get.put(AuditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return controller.getAuditActivityList();
        },
        color: AppColors.primaryDarkColor,
        child: Obx(
          () => ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                var data = controller.auditActivityList[index];
                return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteConst.auditDetail, arguments: {
                        "auditWithCustomer": data,
                        "sections": controller.sections
                      });
                    },
                    child: AuditCard(data: data));
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: controller.auditActivityList.length),
        ),
      ),
    );
  }
}
