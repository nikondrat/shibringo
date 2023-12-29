import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  late Dio dio;

  DioService() {
    dio = Dio();

    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}
