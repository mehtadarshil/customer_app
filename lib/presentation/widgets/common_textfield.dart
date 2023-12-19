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
      this.prefix,
      this.onlyRead = false,
      this.onTap,
      this.textInputAction});

  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final bool onlyRead;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      onTap: onTap,
      readOnly: onlyRead,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: AppColors.primaryDarkColor,
      style: TextStyle(
          fontFamily: FontFamily.interMedium,
          fontSize: 18,
          color: AppColors.textfieldTitleColor),
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: FontFamily.interMedium,
            fontSize: 18,
            color: AppColors.textfieldBorderColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: AppColors.textfieldBorderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: AppColors.textfieldBorderColor, width: 1.5),
        ),
      ),
    );
  }
}