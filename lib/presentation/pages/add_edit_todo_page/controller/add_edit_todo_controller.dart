import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/logger.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/entity/todo_entity.dart';
import 'package:customer_app/data/model/options_model.dart';
import 'package:customer_app/data/model/todo_create_model.dart';
import 'package:customer_app/data/model/todo_model.dart';
import 'package:customer_app/presentation/pages/todo_page/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddEditTodoController extends GetxController {
  final Datum? args = Get.arguments;
  final TodoController todoController = Get.find();

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
    getOptions().then((value) {
      if (optionsModel.value != null) {
        if (args != null) {
          Logger.prints(args?.employeeId);
          Logger.prints(optionsModel.value?.data?.toJson());
          taskDescriptionController.text = args?.taskDescription ?? "";
          selectedCategoryId.value = args?.taskCategoryId ?? "";
          selectedPriority.value = args?.priority ?? "";
          locationController.text = args?.location ?? "";
          if (optionsModel.value!.data!.employee!
              .any((element) => element.employeeId == args!.employeeId)) {
            selectedEmployee.value = args?.employeeId ?? "";
          }
          if (args?.startDate != null) {
            startDateController.text =
                DateFormat("dd MMM yyyy hh:mm aa").format(args!.startDate!);
          }
          if (args?.dueDate != null) {
            dueDateController.text =
                DateFormat("dd MMM yyyy hh:mm aa").format(args!.dueDate!);
          }
        }
      }
    });

    super.onReady();
  }

  Future getOptions() async {
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

  void createTodo(TodoEntity data) async {
    try {
      var tempData =
          await _apiClient.post(path: ApiConst.create, body: data.toJson());
      if (tempData != null) {
        Get.back();
        todoController.getTodoList();
        SnackBarUtil.showSnackBar(
            message: TodoCreateModel.fromJson(tempData).message ?? "");
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }

  void editTodo(TodoEntity data) async {
    try {
      var tempData =
          await _apiClient.post(path: ApiConst.edit, body: data.toJson());

      if (tempData != null) {
        Get.back();
        todoController.getTodoList();
        SnackBarUtil.showSnackBar(
            message: TodoCreateModel.fromJson(tempData).message ?? "");
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }
}
