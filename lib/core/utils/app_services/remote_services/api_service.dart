import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:when/core/utils/app_services/local_services/cache_token.dart';

import '../../../../main_importants.dart';
import '../../../../my_app.dart';
import '../../../errors/failure.dart';
import 'end_points.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = EndPoints.baseUrl;
    // _dio.options.connectTimeout = const Duration(seconds: 30);
    // _dio.options.receiveTimeout = const Duration(seconds: 30);

    // Attach interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add default headers
        options.headers["Accept"] = "application/json";
        options.headers["Accept-Language"] = _getCurrentLanguage();


        // Add user token if available
        if (CacheTokenManger.userToken != null &&
            CacheTokenManger.userToken!.isNotEmpty) {
          options.headers["Authorization"] =
          "Bearer ${CacheTokenManger.userToken}";
        }

        debugPrint("➡️ [REQUEST] ${options.method} ${options.uri}");
        debugPrint("Headers: ${options.headers}");
        debugPrint("Data: ${options.data}");
        debugPrint("Query: ${options.queryParameters}");

        return handler.next(options); // continue
      },
      onResponse: (response, handler) {
        debugPrint("✅ [RESPONSE] [${response.statusCode}] ${response.requestOptions.uri}");
        debugPrint("Response Data: ${response.data}");
        return handler.next(response); // continue
      },
      onError: (DioException error, handler) async {
        debugPrint("❌ [ERROR] ${error.message}");
        debugPrint("Request: ${error.requestOptions.uri}");
        // Example: handle token expiration (401 Unauthorized)
        final failure = ServerFailure.fromDioError(error);
        debugPrint("❌ [ERROR] ${failure.errMessage}");
        // ScaffoldMessenger.of(MyApp.navigatorKey.currentContext!).showSnackBar(
        //   SnackBar(
        //     content: Text(failure.errMessage),
        //     backgroundColor: Colors.red,
        //   ),
        // );
        return handler.reject(error.copyWith(
          error: failure,
        ));
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

  }

  String _getCurrentLanguage() {
    try {
      final context = MyApp.navigatorKey.currentContext;
      if (context != null) {
        final langCode = EasyLocalization.of(context)?.locale.languageCode ?? 'ar';
        return langCode == 'ar' ? 'ar' : 'en';
      }
      return 'ar';
    } catch (e) {
      return 'ar';
    }
  }


  // Now no need to manually add headers everywhere
  Future<Response> postData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
    bool isMultipart = false,
  }) async {
    if (isMultipart) {
      _dio.options.headers["Content-Type"] = "multipart/form-data";
    }
    return await _dio.post(endPoint, data: data, queryParameters: query);
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(endPoint, queryParameters: query);
  }

  Future<Response> putData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.put(endPoint, data: data, queryParameters: query);
  }

  Future<Response> deleteData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.delete(endPoint, data: data, queryParameters: query);
  }
}
