import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/dialog_util.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/entity/todo_entity.dart';
import 'package:customer_app/presentation/pages/add_edit_todo_page/controller/add_edit_todo_controller.dart';
import 'package:customer_app/presentation/widgets/common-dropdown.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:customer_app/presentation/widgets/common_button.dart';
import 'package:customer_app/presentation/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddEditTodoPage extends GetView<AddEditTodoController> {
  const AddEditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
          title: controller.args != null
              ? Strings.strEditTodo
              : Strings.strAddTodo,
          context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextfield(
              controller: controller.taskDescriptionController,
              hintText: Strings.strTaskDescription,
              maxLines: 4,
              maxLength: 350,
            ),
            Obx(
              () => CommonDropdown(
                hintText: Strings.strSelectCategory,
                items: controller.optionsModel.value != null
                    ? controller.optionsModel.value!.data!.taskCategory!
                        .map((e) => DropdownMenuItem(
                              value: e.pkId,
                              child: Text(
                                e.taskCategory ?? "",
                              ),
                            ))
                        .toList()
                    : null,
                value: controller.selectedCategoryId.value.isEmpty
                    ? null
                    : controller.selectedCategoryId.value,
                onChanged: (newValue) {
                  controller.selectedCategoryId.value = newValue.toString();
                },
              ),
            ).paddingSymmetric(vertical: 15),
            Obx(
              () => CommonDropdown(
                hintText: Strings.strSelectPriority,
                items: controller.priorityList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                value: controller.selectedPriority.value.isEmpty ||
                        controller.selectedPriority.value == "Priority"
                    ? null
                    : controller.selectedPriority.value,
                onChanged: (newValue) {
                  controller.selectedPriority.value = newValue.toString();
                },
              ),
            ),
            CommonTextfield(
                    controller: controller.locationController,
                    hintText: Strings.strLocation)
                .paddingSymmetric(vertical: 15),
            Obx(
              () => CommonDropdown(
                hintText: Strings.strAssignTo,
                items: controller.optionsModel.value != null
                    ? controller.optionsModel.value!.data!.employee!
                        .map((e) => DropdownMenuItem(
                              value: e.employeeId,
                              child: Text(e.screenFullName ?? ""),
                            ))
                        .toList()
                    : null,
                value: controller.selectedEmployee.value.isEmpty
                    ? null
                    : controller.selectedEmployee.value,
                onChanged: (newValue) {
                  controller.selectedEmployee.value = newValue.toString();
                },
              ),
            ),
            CommonTextfield(
              controller: controller.startDateController,
              onlyRead: true,
              hintText: Strings.strStartDate,
              onTap: () async {
                var dateTime =
                    await DialogUtil.showDateTimePicker(context: context);
                if (dateTime != null) {
                  controller.startDateController.text =
                      DateFormat("dd MMM yyyy hh:mm aa").format(dateTime);
                }
              },
            ).paddingSymmetric(vertical: 15),
            CommonTextfield(
              controller: controller.dueDateController,
              onlyRead: true,
              hintText: Strings.strDueDate,
              onTap: () async {
                var dateTime =
                    await DialogUtil.showDateTimePicker(context: context);
                if (dateTime != null) {
                  controller.dueDateController.text =
                      DateFormat("dd MMM yyyy hh:mm aa").format(dateTime);
                }
              },
            ),
            CommonButton(
                    onTap: () {
                      TodoEntity todoEntity = TodoEntity();
                      if (controller.taskDescriptionController.text.isEmpty) {
                        SnackBarUtil.showSnackBar(
                            message: Strings.strPleaseEnterTaskDescription);
                      } else if (controller.selectedCategoryId.isEmpty) {
                        SnackBarUtil.showSnackBar(
                            message: Strings.strPleaseSelectCategory);
                      } else if (controller.selectedPriority.isEmpty ||
                          controller.selectedPriority.value == "Priority") {
                        SnackBarUtil.showSnackBar(
                            message: Strings.strPleaseSelectPriority);
                      } else if (controller.selectedEmployee.isEmpty) {
                        SnackBarUtil.showSnackBar(
                            message: Strings.strPleaseSelectEmployee);
                      } else if (controller.startDateController.text.isEmpty) {
                        SnackBarUtil.showSnackBar(
                            message: Strings.strPleaseSelectStartDate);
                      } else if (controller.dueDateController.text.isEmpty) {
                        SnackBarUtil.showSnackBar(
                            message: Strings.strPleaseSelectCategory);
                      } else {
                        if (controller.args != null) {
                          controller.editTodo(todoEntity);
                        } else {
                          controller.createTodo(todoEntity);
                        }
                      }
                    },
                    text: Strings.strSave)
                .paddingSymmetric(vertical: 40)
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 25),
      ),
    );
  }
}
