import 'package:customer_app/presentation/pages/audit_detail_page/controller/audit_detail_controller.dart';
import 'package:get/get.dart';

class AuditDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuditDetailController());
  }
}
