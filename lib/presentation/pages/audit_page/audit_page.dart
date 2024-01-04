import 'package:customer_app/presentation/pages/audit_page/controller/audit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuditPage extends GetView<AuditController> {
  const AuditPage({super.key});

  @override
  AuditController get controller => Get.put(AuditController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
