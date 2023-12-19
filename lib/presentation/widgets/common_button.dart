import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLight = false,
    this.icon,
    this.height,
    this.width,
    this.textStyle,
    this.sizedBoxWidth,
  });

  final VoidCallback onTap;
  final String text;
  final bool isLight;
  final Widget? icon;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final double? sizedBoxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 57,
        width: width,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: isLight
                ? AppColors.primaryDarkColor
                : AppColors.primaryLightColor,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0)),
            padding: const EdgeInsets.all(0.0),
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: isLight ? AppColors.actionButtonLightColor : null,
              gradient: isLight
                  ? null
                  : LinearGradient(colors: [
                      AppColors.primaryLightColor,
                      AppColors.primaryDarkColor
                    ]),
              borderRadius: const BorderRadius.all(Radius.circular(28.0)),
            ),
            child: Container(
              alignment: Alignment.center,
              child: icon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icon!,
                        SizedBox(
                          width: sizedBoxWidth ?? 17,
                        ),
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: isLight
                              ? TextStyle(
                                  fontFamily: FontFamily.interBold,
                                  fontSize: 18,
                                  color: AppColors.primaryDarkColor)
                              : const TextStyle(
                                  fontFamily: FontFamily.interBold,
                                  fontSize: 18,
                                  color: AppColors.whiteColor),
                        ),
                      ],
                    )
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          (isLight
                              ? TextStyle(
                                  fontFamily: FontFamily.interBold,
                                  fontSize: 18,
                                  color: AppColors.primaryDarkColor)
                              : const TextStyle(
                                  fontFamily: FontFamily.interBold,
                                  fontSize: 18,
                                  color: AppColors.whiteColor)),
                    ).paddingSymmetric(horizontal: 10),
            ),
          ),
        ));
  }
}
