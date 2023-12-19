import 'package:customer_app/app/config/db_keys.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/routes/route_const.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/entity/customer_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController companyIdController = TextEditingController();

  void saveLogin() async {
    if (userIdController.text.isEmpty) {
      SnackBarUtil.showSnackBar(message: Strings.strPleaseEnterProperUserId);
    } else if (companyIdController.text.isEmpty) {
      SnackBarUtil.showSnackBar(message: Strings.strPleaseEnterProperCompanyId);
    } else {
      await GetStorage().write(
          DBKeys.customerListEntity,
          CustomerListEntity(
                  listMode: true,
                  loginUserId: userIdController.text,
                  companyId: companyIdController.text)
              .toJson());
      Get.offAllNamed(RouteConst.homePage);
    }
  }
}
