import 'package:customer_app/app/config/appcolors.dart';
import 'package:customer_app/app/routes/route_const.dart';
import 'package:customer_app/presentation/pages/todo_page/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/todo_card.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  TodoController get controller => Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return controller.getTodoList();
        },
        color: AppColors.primaryDarkColor,
        child: Obx(
          () => ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              var data = controller.todoList[index];
              return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConst.addEditTodo, arguments: data);
                  },
                  child: TodoCard(data: data));
            },
            itemCount: controller.todoList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
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
