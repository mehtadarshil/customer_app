import 'package:customer_app/app/config/api_const.dart';
import 'package:customer_app/app/services/app_base_component.dart';
import 'package:customer_app/app/services/logger.dart';
import 'package:get/get.dart';

class ApiClient {
  final GetConnect _getConnect = GetConnect();

  Future get({required String path}) async {
    AppBaseComponent.instance.startLoading();
    Logger.prints("${ApiConst.baseUrl}$path");
    var response = await _getConnect.get("${ApiConst.baseUrl}$path");
    AppBaseComponent.instance.stopLoading();
    return response.body;
  }

  Future post({required String path, Map? body}) async {
    AppBaseComponent.instance.startLoading();
    Logger.prints("${ApiConst.baseUrl}$path");
    var response = await _getConnect.post("${ApiConst.baseUrl}$path", body);
    AppBaseComponent.instance.stopLoading();
    return response.body;
  }
}
