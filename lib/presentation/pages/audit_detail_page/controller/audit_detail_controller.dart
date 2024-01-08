import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/entity/audit_edit_entity.dart';
import 'package:customer_app/data/model/audit_activity_model.dart';
import 'package:customer_app/data/model/options_model.dart';
import 'package:get/get.dart';

class AuditDetailController extends GetxController {
  final AuditWithCustomer? auditWithCustomer =
      Get.arguments["auditWithCustomer"];
  final List<Section>? sections = Get.arguments["sections"];

  final ApiClient _apiClient = Get.find();

  void editAudit(AuditEditEntity data) async {
    try {
      var tempData = await _apiClient.post(
          path: ApiConst.editAuditActivity, body: data.toJson());
      if (tempData != null) {
        Get.close(1);
        SnackBarUtil.showSnackBar(
            message: OptionsModel.fromJson(tempData).message ?? "");
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }
}
