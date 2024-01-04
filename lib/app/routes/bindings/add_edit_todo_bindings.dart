import 'package:customer_app/presentation/pages/add_edit_todo_page/controller/add_edit_todo_controller.dart';
import 'package:get/get.dart';

class AddEditTodoBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddEditTodoController());
  }
}
