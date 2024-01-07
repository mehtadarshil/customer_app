import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends AppBar {
  CommonAppbar(
      {Key? key,
      required String title,
      required BuildContext context,
      bool backDisable = false,
      VoidCallback? onClick,
      List<Widget>? actions,
      Widget? leading,
      bool hasLeadingIcon = true,
      Widget? child})
      : super(
            key: key,
            backgroundColor: AppColors.primaryDarkColor,
            elevation: 3,
            actions: actions,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            centerTitle: true,
            leading: ModalRoute.of(context)!.canPop
                ? GestureDetector(
                    onTap: () {
                      if (onClick != null) {
                        onClick();
                      }
                      if (!backDisable) {
                        Get.back();
                      }
                    },
                    child: child ??
                        const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.whiteColor,
                        ))
                : leading,
            title: Text(
              title,
              style: const TextStyle(
                  fontFamily: FontFamily.interBold, fontSize: 20),
            ));
}
