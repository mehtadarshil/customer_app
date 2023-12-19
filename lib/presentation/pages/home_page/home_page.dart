import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/data/model/customer_list_model.dart';
import 'package:customer_app/presentation/pages/home_page/controller/home_controller.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:customer_app/presentation/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: Strings.strHome, context: context),
      body: PagedListView<int, Detail>(
        pagingController: controller.pagingController,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        builderDelegate: PagedChildBuilderDelegate<Detail>(
          itemBuilder: (context, item, index) => CustomerCard(
            item: item,
          ).paddingOnly(bottom: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryDarkColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
