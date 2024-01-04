import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDropdown extends StatelessWidget {
  const CommonDropdown(
      {super.key,
      required this.hintText,
      this.items,
      this.onChanged,
      this.value});

  final String hintText;
  final List<DropdownMenuItem<Object?>>? items;
  final Function(Object? newValue)? onChanged;
  final Object? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(width: 1.5, color: AppColors.textfieldBorderColor)),
      child: DropdownButton2(
        items: items,
        value: value,
        style: TextStyle(
            fontFamily: FontFamily.interMedium,
            fontSize: 18,
            color: AppColors.textfieldTitleColor),
        isExpanded: true,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        dropdownDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16)),
        dropdownMaxHeight: Get.height * 0.3,
        underline: const SizedBox.shrink(),
        hint: Text(
          hintText,
          style: TextStyle(
              fontFamily: FontFamily.interMedium,
              fontSize: 18,
              color: AppColors.textfieldBorderColor),
        ),
      ),
    );
  }
}
