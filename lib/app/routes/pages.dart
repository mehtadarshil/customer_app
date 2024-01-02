import 'package:customer_app/app/routes/bindings/home_bindings.dart';
import 'package:customer_app/app/routes/route_const.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages {
  static final List<GetPage> pages = [
    getpage(
        name: RouteConst.homePage,
        page: const HomePage(),
        bindings: HomeBindings()),
  ];
}

GetPage getpage(
        {required String name, required Widget page, Bindings? bindings}) =>
    GetPage(
        name: name,
        page: () => WillPopScope(
            onWillPop: () async {
              if (AppBaseComponent.instance.completed.value) {
                return true;
              } else {
                return false;
              }
            },
            child: page),
        binding: bindings,
        transition: Transition.cupertino);
