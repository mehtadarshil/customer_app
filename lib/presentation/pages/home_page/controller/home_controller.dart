import 'package:customer_app/app/config/db_keys.dart';
import 'package:customer_app/app/services/api_client.dart';
import 'package:customer_app/app/services/logger.dart';
import 'package:customer_app/data/entity/customer_list_entity.dart';
import 'package:customer_app/data/model/customer_list_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  final PagingController<int, Detail> pagingController =
      PagingController(firstPageKey: 2);
  final ApiClient _apiClient = Get.find();
  final int _pageSize = 10;

  @override
  void onReady() {
    loadCustomerList(1);
    pagingController.addPageRequestListener((pageKey) {
      loadCustomerList(pageKey);
    });
    super.onReady();
  }

  void loadCustomerList(int pageKey) async {
    try {
      var body = CustomerListEntity.fromJson(
          GetStorage().read(DBKeys.customerListEntity));

      final newItems = CustomerListModel.fromJson(await _apiClient.post(
              path: "$pageKey-$_pageSize", body: body.toJson()))
          .data!
          .details;
      final isLastPage = newItems!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      Logger.prints(error);
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
