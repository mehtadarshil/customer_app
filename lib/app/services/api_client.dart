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
    Logger.prints(response.body);
    AppBaseComponent.instance.stopLoading();
    return response.statusCode == 200 ? response.body : null;
  }

  Future post({required String path, Map? body}) async {
    AppBaseComponent.instance.startLoading();
    Logger.prints("${ApiConst.baseUrl}$path");
    Logger.prints("body $body");
    var response = await _getConnect.post("${ApiConst.baseUrl}$path", body);
    Logger.prints("post response ${response.body}");
    AppBaseComponent.instance.stopLoading();
    return response.statusCode == 200 ? response.body : null;
  }

  Future delete({required String path}) async {
    AppBaseComponent.instance.startLoading();
    Logger.prints("${ApiConst.baseUrl}$path");
    var response = await _getConnect.delete("${ApiConst.baseUrl}$path");
    Logger.prints("post response ${response.body}");
    AppBaseComponent.instance.stopLoading();
    return response.statusCode == 200 ? response.body : null;
  }
}
