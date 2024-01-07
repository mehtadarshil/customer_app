import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/config/strings.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/snackbar_util.dart';
import 'package:customer_app/data/model/todo_model.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final ApiClient _apiClient = Get.find();
  RxList<Datum> todoList = <Datum>[].obs;

  @override
  void onReady() {
    getTodoList();
    super.onReady();
  }

  Future getTodoList() async {
    try {
      var tempData = await _apiClient.get(path: ApiConst.tasks);
      if (tempData != null) {
        todoList.value = TodoModel.fromJson(tempData).data ?? [];
      }
    } catch (e) {
      AppBaseComponent.instance.stopLoading();
      SnackBarUtil.showSnackBar(message: Strings.strSomethingWentWrong);
    }
  }
}
