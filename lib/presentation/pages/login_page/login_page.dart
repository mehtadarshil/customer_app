import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/presentation/pages/login_page/controller/login_controller.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:customer_app/presentation/widgets/common_button.dart';
import 'package:customer_app/presentation/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: Strings.strLogin,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextfield(
              controller: controller.userIdController,
              hintText: Strings.strEnterUserId,
              textInputAction: TextInputAction.next,
            ).paddingOnly(bottom: 15),
            CommonTextfield(
              controller: controller.companyIdController,
              hintText: Strings.strEnterCompanyId,
            ).paddingOnly(bottom: 30),
            CommonButton(
                onTap: () {
                  controller.saveLogin();
                },
                text: Strings.strSave)
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 25),
      ),
    );
  }
}
