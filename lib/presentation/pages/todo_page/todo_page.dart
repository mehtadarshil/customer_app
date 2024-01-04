import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/routes/route_const.dart';
import 'package:customer_app/presentation/pages/todo_page/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  TodoController get controller => Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            var data = controller.todoList[index];
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ]),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(data.taskDescription ?? "")],
              ),
            );
          },
          itemCount: controller.todoList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteConst.addEditTodo);
        },
        splashColor: AppColors.primaryLightColor,
        backgroundColor: AppColors.primaryDarkColor,
        elevation: 2,
        child: const Icon(
          Icons.add_rounded,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
