import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/routes/bindings/initial_bindings.dart';
import 'package:customer_app/app/routes/pages.dart';
import 'package:customer_app/app/routes/route_const.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app/config/strings.dart';
import 'app/services/app_base_component.dart';
import 'presentation/widgets/custom_scroll_behaviour.dart';
import 'gen/fonts.gen.dart';

void main() async {
  FlutterError.onError = (details) {
    SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    AppBaseComponent.instance.startLoading();
  };
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConst.loginPage,
      initialBinding: InitialBindings(),
      getPages: Pages.pages,
      builder: (context, child) {
        return Stack(
          children: [
            ScrollConfiguration(
              behavior: CustomScrollBehaviour(),
              child: child!,
            ),
            StreamBuilder<bool>(
              initialData: false,
              stream: AppBaseComponent.instance.progressStream,
              builder: (context, snapshot) {
                return Obx(
                  () => AppBaseComponent.instance.completed.value
                      ? const Offstage()
                      : Positioned.fill(
                          child: AnimatedOpacity(
                            opacity: snapshot.data! ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                              child: Center(
                                child: LoadingAnimationWidget.discreteCircle(
                                    color: AppColors.primaryLightColor,
                                    size: 40),
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
            StreamBuilder<bool>(
              initialData: true,
              stream: AppBaseComponent.instance.networkStream,
              builder: (context, snapshot) {
                return Positioned(
                    top: 0,
                    child: SafeArea(
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.primaryLightColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 14,
                                  spreadRadius: 0,
                                  color: AppColors.shadowColor)
                            ],
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(15))),
                        height: snapshot.data! ? 0 : 100,
                        width: Get.width,
                        curve: Curves.decelerate,
                        duration: const Duration(seconds: 1),
                        child: const Material(
                          type: MaterialType.transparency,
                          child: Text(
                            Strings.strNoInternetAvailable,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontFamily: FontFamily.interSemiBold,
                                color: AppColors.whiteColor,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ));
              },
            )
          ],
        );
      },
    );
  }
}
