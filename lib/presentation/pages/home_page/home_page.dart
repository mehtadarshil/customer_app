import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/presentation/pages/home_page/controller/home_controller.dart';
import 'package:customer_app/presentation/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: Strings.strHome,
        context: context,
      ),
      body: ListView.builder(itemBuilder: (context, index) => controller.,),
    );
  }
}
