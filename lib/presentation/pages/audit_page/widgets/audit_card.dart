import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/data/model/audit_activity_model.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AuditCard extends StatelessWidget {
  const AuditCard({
    super.key,
    required this.data,
  });

  final AuditWithCustomer data;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.customerName ?? "",
                    style: const TextStyle(
                        fontFamily: FontFamily.interSemiBold, fontSize: 16),
                  ),
                  Text(
                    data.contactNo1 ?? "",
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 12),
                  )
                ],
              )),
              Text(
                data.baseRating ?? "",
                style: const TextStyle(
                    fontFamily: FontFamily.interMedium, fontSize: 15),
              )
            ],
          ).paddingOnly(top: 2),
          Divider(
            color: AppColors.primaryDarkColor,
          ),
          if (data.auditDate != null)
            Row(
              children: [
                Text(
                  Strings.strAuditDateField,
                  style: TextStyle(
                      fontFamily: FontFamily.interMedium,
                      fontSize: 15,
                      color: AppColors.textfieldTitleColor),
                ),
                Expanded(
                  child: Text(
                    DateFormat("dd-MMM-yyyy").format(data.auditDate!),
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 15),
                  ),
                )
              ],
            ).paddingOnly(bottom: 3),
          if (data.area != null)
            Row(
              children: [
                Text(
                  Strings.strAreaField,
                  style: TextStyle(
                      fontFamily: FontFamily.interMedium,
                      fontSize: 15,
                      color: AppColors.textfieldTitleColor),
                ),
                Expanded(
                  child: Text(
                    data.area ?? "",
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 15),
                  ),
                )
              ],
            ).paddingOnly(bottom: 3),
          if (data.city != null)
            Row(
              children: [
                Text(
                  Strings.strCityField,
                  style: TextStyle(
                      fontFamily: FontFamily.interMedium,
                      fontSize: 15,
                      color: AppColors.textfieldTitleColor),
                ),
                Expanded(
                  child: Text(
                    data.city ?? "",
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 15),
                  ),
                )
              ],
            ).paddingOnly(bottom: 3),
          if (data.employeeName != null)
            Row(
              children: [
                Text(
                  Strings.strAuditedByField,
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
            ),
        ],
      ),
    );
  }
}
