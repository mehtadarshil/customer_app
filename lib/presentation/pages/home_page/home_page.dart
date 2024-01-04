import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/presentation/pages/audit_page/audit_page.dart';
import 'package:customer_app/presentation/pages/home_page/controller/home_controller.dart';
import 'package:customer_app/presentation/pages/todo_page/todo_page.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: Strings.strAppName,
        context: context,
      ),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [TodoPage(), AuditPage()],
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.primaryDarkColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.pageNo.value = 0;
                },
                child: Container(
                  color: Colors.transparent,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          size: 26,
                          color: Colors.white.withOpacity(
                              controller.pageNo.value == 0 ? 1 : 0.5),
                        ).paddingOnly(bottom: 3),
                        Text(
                          Strings.strTodo,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(
                                  controller.pageNo.value == 0 ? 1 : 0.5)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.pageNo.value = 1;
                },
                child: Container(
                  color: Colors.transparent,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_turned_in_outlined,
                          size: 26,
                          color: Colors.white.withOpacity(
                              controller.pageNo.value == 1 ? 1 : 0.5),
                        ).paddingOnly(bottom: 3),
                        Text(
                          Strings.strAudit,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(
                                  controller.pageNo.value == 1 ? 1 : 0.5)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
