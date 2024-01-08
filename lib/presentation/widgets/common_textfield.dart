import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield(
      {super.key,
      required this.controller,
      this.obscureText = false,
      this.keyboardType,
      this.hintText,
      this.maxLines = 1,
      this.prefix,
      this.onlyRead = false,
      this.onTap,
      this.isDense = false,
      this.textInputAction,
      this.maxLength});

  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final bool onlyRead;
  final bool isDense;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      onTap: onTap,
      readOnly: onlyRead,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textInputAction: textInputAction,
      cursorColor: AppColors.primaryDarkColor,
      style: TextStyle(
          fontFamily: FontFamily.interMedium,
          fontSize: isDense ? 15 : 18,
          color: AppColors.textfieldTitleColor),
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: hintText,
        contentPadding:
            isDense ? const EdgeInsets.symmetric(horizontal: 10) : null,
        hintStyle: TextStyle(
            fontFamily: FontFamily.interMedium,
            fontSize: isDense ? 15 : 18,
            color: AppColors.textfieldBorderColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isDense ? 10 : 16),
          borderSide:
              BorderSide(color: AppColors.textfieldBorderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isDense ? 10 : 16),
          borderSide:
              BorderSide(color: AppColors.textfieldBorderColor, width: 1.5),
        ),
      ),
    );
  }
}
