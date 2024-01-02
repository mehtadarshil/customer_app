import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:customer_app/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetUtil {
  static void showConfirmSheet(
          {required String title, required VoidCallback onConfirm}) =>
      Get.bottomSheet(
        Material(
          type: MaterialType.transparency,
          child: ConfirmationSheet(
            onConfirm: onConfirm,
            title: title,
          ),
        ),
      );
}

class ConfirmationSheet extends StatelessWidget {
  const ConfirmationSheet({
    super.key,
    required this.title,
    required this.onConfirm,
  });
  final String title;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: FontFamily.interSemiBold,
              fontSize: 18,
            ),
          ).paddingSymmetric(horizontal: 20, vertical: 15),
          Row(
            children: [
              Expanded(
                  child: CommonButton(
                      isLight: true,
                      onTap: () {
                        Get.back();
                      },
                      text: Strings.strNo)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: CommonButton(
                      onTap: () {
                        Get.back();
                        onConfirm();
                      },
                      text: Strings.strYes))
            ],
          ).paddingSymmetric(horizontal: 25).paddingOnly(bottom: 10)
        ],
      ),
    );
  }
}
