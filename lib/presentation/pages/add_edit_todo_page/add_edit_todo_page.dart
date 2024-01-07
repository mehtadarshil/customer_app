import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/bottom_sheet_util.dart';
import 'package:customer_app/app/services/dialog_util.dart';
import 'package:customer_app/app/services/logger.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/entity/todo_entity.dart';
import 'package:customer_app/gen/fonts.gen.dart';
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
          actions: controller.args != null
              ? [
                  ButtonBar(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BottomSheetUtil.showConfirmSheet(
                            title: Strings.strAreYouSureYouWantToDeleteThisTodo,
                            onConfirm: () {
                              controller.deleteTask(
                                  int.parse(controller.args!.pkId!));
                            },
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            size: 25,
                          ),
                        ).paddingOnly(right: 10),
                      )
                    ],
                  )
                ]
              : null,
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
                  Logger.prints(newValue);
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
                  controller.taggedEmployee
                      .remove(int.parse(newValue.toString()));
                },
              ),
            ),
            CommonTextfield(
              controller: controller.startDateController,
              onlyRead: true,
              hintText: Strings.strStartDate,
              onTap: () async {
                controller.startDate =
                    await DialogUtil.showDateTimePicker(context: context);
                if (controller.startDate != null) {
                  controller.startDateController.text =
                      DateFormat("dd MMM yyyy hh:mm aa")
                          .format(controller.startDate!);
                }
              },
            ).paddingSymmetric(vertical: 15),
            CommonTextfield(
              controller: controller.dueDateController,
              onlyRead: true,
              hintText: Strings.strDueDate,
              onTap: () async {
                controller.dueDate =
                    await DialogUtil.showDateTimePicker(context: context);
                if (controller.dueDate != null) {
                  controller.dueDateController.text =
                      DateFormat("dd MMM yyyy hh:mm aa")
                          .format(controller.dueDate!);
                }
              },
            ).paddingOnly(bottom: 15),
            CommonTextfield(
              controller: controller.taggedEmployeeController,
              onlyRead: true,
              hintText: Strings.strAllEmployeeStackholder,
              onTap: () async {
                if (controller.optionsModel.value != null &&
                    controller.args == null) {
                  var finalData = controller.optionsModel.value!.data!.employee!
                      .where((element) =>
                          element.employeeId !=
                          controller.selectedEmployee.value);
                  Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Strings.strSelectEmployee,
                          style: TextStyle(
                              fontFamily: FontFamily.interBold, fontSize: 20),
                        ).paddingSymmetric(horizontal: 15, vertical: 20),
                        Expanded(
                          child: finalData.isEmpty
                              ? const Center(
                                  child: Text(
                                    Strings.strNoDataFound,
                                    style: TextStyle(
                                        fontFamily: FontFamily.interMedium,
                                        fontSize: 16),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: finalData.length,
                                  itemBuilder: (context, index) {
                                    var data = finalData.elementAt(index);
                                    return Obx(
                                      () => CheckboxListTile(
                                        activeColor: AppColors.primaryDarkColor,
                                        value: controller.taggedEmployee
                                            .contains(
                                                int.parse(data.employeeId!)),
                                        title: Text(
                                          data.screenFullName ?? "",
                                          style: const TextStyle(
                                              fontFamily:
                                                  FontFamily.interRegular,
                                              fontSize: 14),
                                        ),
                                        onChanged: (value) {
                                          if (value!) {
                                            controller.taggedEmployee.add(
                                                int.parse(data.employeeId!));
                                          } else {
                                            controller.taggedEmployee.remove(
                                                int.parse(data.employeeId!));
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ));
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
                            message: Strings.strPleaseSelectDueDate);
                      } else {
                        if (controller.args != null) {
                          todoEntity.id =
                              int.tryParse(controller.args!.pkId ?? "");
                          todoEntity.actualDeliveryDate =
                              controller.args!.actualDeliveryDate;
                          todoEntity.closingRemarks =
                              controller.args!.closingRemarks;
                          todoEntity.completionDate =
                              controller.args!.completionDate;
                          todoEntity.createdBy = controller.args!.createdBy;
                          todoEntity.customerId =
                              int.tryParse(controller.args!.customerId ?? "");
                          todoEntity.deliveryDate =
                              controller.args!.deliveryDate;
                          todoEntity.dueDate = controller.args!.dueDate;
                          todoEntity.employeeId =
                              int.tryParse(controller.selectedEmployee.value);
                          todoEntity.latitude = controller.args!.latitude;
                          todoEntity.location = controller.args!.location;
                          todoEntity.longitude = controller.args!.longitude;
                          todoEntity.priority =
                              controller.selectedPriority.value;
                          todoEntity.reminder =
                              (controller.args!.reminder ?? false) ? 1 : 0;
                          todoEntity.reminderMonth = int.tryParse(
                              controller.args!.reminderMonth ?? "");
                          todoEntity.startDate = controller.args!.startDate;
                          todoEntity.taskCategoryId =
                              int.tryParse(controller.selectedCategoryId.value);
                          todoEntity.taskDescription =
                              controller.taskDescriptionController.text;
                          todoEntity.updatedBy = controller.args!.updatedBy;
                          todoEntity.createdDate = controller.args!.createdDate;
                          todoEntity.updatedDate = DateTime.now();
                          controller.editTodo(todoEntity);
                        } else {
                          Logger.prints(
                              "id ${controller.selectedPriority.value}");
                          todoEntity.taskDescription =
                              controller.taskDescriptionController.text;
                          todoEntity.taskCategoryId =
                              int.tryParse(controller.selectedCategoryId.value);
                          todoEntity.priority =
                              controller.selectedPriority.value;
                          todoEntity.location =
                              controller.locationController.text;
                          todoEntity.employeeId =
                              int.tryParse(controller.selectedEmployee.value);
                          todoEntity.startDate = controller.startDate;
                          todoEntity.dueDate = controller.dueDate;
                          todoEntity.createdDate = DateTime.now();
                          todoEntity.createdBy = "admin";
                          todoEntity.updatedBy = "admin";
                          todoEntity.updatedDate = DateTime.now();
                          todoEntity.multiAssignEmp =
                              controller.taggedEmployee.toList();
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
