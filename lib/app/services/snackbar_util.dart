import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static void showSnackBar(
      {String? title,
      required String message,
      Duration? duration,
      bool? success}) {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        message,
        style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 15,
            fontFamily: FontFamily.interSemiBold),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      animationDuration: const Duration(milliseconds: 600),
      duration: duration ?? const Duration(seconds: 6),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      boxShadows: [BoxShadow(color: AppColors.shadowColor, blurRadius: 10)],
      barBlur: 0,
      backgroundColor: (success ?? false)
          ? AppColors.color46B203
          : AppColors.primaryLightColor,
      snackStyle: SnackStyle.FLOATING,

      // backgroundGradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [AppColors.primaryDarkColor, AppColors.primaryLightColor]),
    ));
  }
}
