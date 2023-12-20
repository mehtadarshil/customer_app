import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/data/model/customer_list_model.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.item,
  });

  final Detail item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.08),
              blurRadius: 5,
              offset: const Offset(0, 2),
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.customerName ?? "",
                  style: const TextStyle(
                      fontFamily: FontFamily.interSemiBold, fontSize: 16),
                ),
              ),
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          size: 19,
                        ).paddingOnly(right: 5),
                        const Text(
                          Strings.strEdit,
                          style: TextStyle(
                              fontFamily: FontFamily.interMedium, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: AppColors.deductPickColor,
                          size: 19,
                        ).paddingOnly(right: 5),
                        Text(
                          Strings.strDelete,
                          style: TextStyle(
                              fontFamily: FontFamily.interMedium,
                              fontSize: 15,
                              color: AppColors.deductPickColor),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          if (item.customerType != null && item.customerType!.trim().isNotEmpty)
            Row(
              children: [
                const Text(
                  Strings.strTypeField,
                  style: TextStyle(fontFamily: FontFamily.interSemiBold),
                ).paddingOnly(right: 5),
                Expanded(
                  child: Text(
                    (item.customerType ?? "").trim(),
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 14),
                  ),
                ),
              ],
            ).paddingOnly(top: 3),
          if (item.createdDate != null)
            Row(
              children: [
                const Text(
                  Strings.strCreatedAtField,
                  style: TextStyle(fontFamily: FontFamily.interSemiBold),
                ).paddingOnly(right: 5),
                Expanded(
                  child: Text(
                    DateFormat("dd MMM yyyy hh:mm aa")
                        .format(item.createdDate!),
                    style: const TextStyle(
                        fontFamily: FontFamily.interRegular, fontSize: 14),
                  ),
                ),
              ],
            ).paddingOnly(top: 3),
          if (item.address != null && item.address!.trim().isNotEmpty)
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: AppColors.primaryDarkColor,
                ).paddingOnly(right: 5),
                Expanded(
                  child: Text(
                    (item.address ?? "").trim(),
                    style: const TextStyle(
                        fontFamily: FontFamily.interMedium, fontSize: 14),
                  ),
                ),
              ],
            ).paddingOnly(top: 3),
        ],
      ).paddingSymmetric(horizontal: 15, vertical: 10),
    );
  }
}
