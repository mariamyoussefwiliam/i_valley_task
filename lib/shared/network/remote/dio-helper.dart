import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:i_valley_task/shared/network/remote/end_points.dart';

import '../../../models/failure/failure_model.dart';
import '../../../models/general/general_model.dart';
import '../error_handler.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
        },
      ),
    );
  }

  static Future<APIResult> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    APIResult result = APIResult();
    final Response response;
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      try {
        response = await dio.post(url, queryParameters: query, data: data);
        result.hasError = false;
        result.data = response.data;
      } on DioError catch (e) {
        result.hasError = true;
        result.failure = handleError(e);
      } catch (e) {
        result.hasError = true;
        print(e.toString());
        result.failure = FailureModel(
            error: "Problem connecting to the server. Please try again.",
            success: false,
            code: -7);
      }
    } else {
      result.hasError = true;
      result.failure = FailureModel(
          success: false,
          error: ResponseMessage.NO_INTERNET_CONNECTION,
          code: -6);
    }
    return result;
  }
}
