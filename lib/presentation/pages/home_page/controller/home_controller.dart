// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/data/model/todo_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiClient _apiClient = Get.find();
  RxList<Datum> todoList = <Datum>[].obs;
  void getTodoList() async {
    todoModelFromJson(await _apiClient.get(path: ApiConst.tasks));
  }
}
