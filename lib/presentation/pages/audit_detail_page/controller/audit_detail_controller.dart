import 'package:customer_app/data/model/audit_activity_model.dart';
import 'package:get/get.dart';

class AuditDetailController extends GetxController {
  final AuditWithCustomer? auditWithCustomer =
      Get.arguments["auditWithCustomer"];
  final List<Section>? sections = Get.arguments["sections"];
}
