import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/model/options_model.dart';
import 'package:customer_app/data/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditTodoController extends GetxController {
  final Datum? args = Get.arguments;

  final ApiClient _apiClient = Get.find();

  Rxn<OptionsModel> optionsModel = Rxn<OptionsModel>();

  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final RxString selectedCategoryId = "".obs;
  final RxString selectedPriority = "".obs;
  final RxString selectedEmployee = "".obs;
  List<String> priorityList = ["High", "Medium", "Low"];

  @override
  void onReady() {
    getOptions();
    super.onReady();
  }

  void getOptions() async {
    try {
      var tempData = await _apiClient.get(path: ApiConst.options);
      if (tempData != null) {
        optionsModel.value = OptionsModel.fromJson(tempData);
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }
}
