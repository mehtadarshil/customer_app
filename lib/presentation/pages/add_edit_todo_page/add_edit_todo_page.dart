import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/presentation/pages/add_edit_todo_page/controller/add_edit_todo_controller.dart';
import 'package:customer_app/presentation/widgets/common-dropdown.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:customer_app/presentation/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                value: controller.selectedPriority.value.isEmpty
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
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 25),
      ),
    );
  }
}
