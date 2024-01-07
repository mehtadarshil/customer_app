import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/model/audit_activity_model.dart';
import 'package:get/get.dart';

class AuditController extends GetxController {
  final ApiClient _apiClient = Get.find();

  RxList<AuditWithCustomer> auditActivityList = <AuditWithCustomer>[].obs;
  List<Section> sections = [];

  @override
  void onReady() {
    getAuditActivityList();
    super.onReady();
  }

  Future getAuditActivityList() async {
    try {
      var tempData = await _apiClient.get(path: ApiConst.auditActivity);
      if (tempData != null) {
        auditActivityList.value =
            AuditActivityModel.fromJson(tempData).data?.auditWithCustomer ?? [];
        sections = AuditActivityModel.fromJson(tempData).data?.section ?? [];
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }
}
