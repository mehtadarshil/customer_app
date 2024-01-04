// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt pageNo = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    pageNo.listen((page) {
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });
    super.onInit();
  }
}
