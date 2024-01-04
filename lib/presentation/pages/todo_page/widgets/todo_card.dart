import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/data/model/todo_model.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.data,
  });

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 5,
                spreadRadius: 1)
          ]),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  data.taskDescription ?? "",
                  style: const TextStyle(
                    fontFamily: FontFamily.interSemiBold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: (data.priority ?? "") == "High"
                      ? AppColors.primaryDarkColor
                      : (data.priority ?? "") == "Medium"
                          ? AppColors.primaryLightColor
                          : AppColors.color46B203,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  data.priority ?? "",
                  style: const TextStyle(color: AppColors.whiteColor),
                ).paddingSymmetric(horizontal: 5, vertical: 3),
              )
            ],
          ),
          Divider(
            color: AppColors.primaryDarkColor,
          ),
          Row(
            children: [
              Text(
                Strings.strAssignToField,
                style: TextStyle(
                    fontFamily: FontFamily.interMedium,
                    fontSize: 15,
                    color: AppColors.textfieldTitleColor),
              ),
              Expanded(
                child: Text(
                  data.employeeName ?? "",
                  style: const TextStyle(
                      fontFamily: FontFamily.interRegular, fontSize: 15),
                ),
              )
            ],
          ).paddingOnly(bottom: 5),
          if (data.startDate != null)
            Row(
              children: [
                Text(
                  Strings.strStartDateField,
                  style: TextStyle(
                      fontFamily: FontFamily.interMedium,
                      fontSize: 15,
                      color: AppColors.textfieldTitleColor),
                ),
                Expanded(
                  child: Text(
                    DateFormat("dd-MMM-yyyy").format(data.startDate!),
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 15),
                  ),
                )
              ],
            ).paddingOnly(bottom: 5),
          if (data.dueDate != null)
            Row(
              children: [
                Text(
                  Strings.strDueDateField,
                  style: TextStyle(
                      fontFamily: FontFamily.interMedium,
                      fontSize: 15,
                      color: AppColors.textfieldTitleColor),
                ),
                Expanded(
                  child: Text(
                    DateFormat("dd-MMM-yyyy").format(data.dueDate!),
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 15),
                  ),
                )
              ],
            ).paddingOnly(bottom: 5)
        ],
      ),
    );
  }
}
