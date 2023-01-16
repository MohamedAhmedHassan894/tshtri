import 'package:dio/dio.dart';

import '../utils/app_constants.dart';
import 'logger_helper.dart';

class DioHelper {
  static late final Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        //to skip exception and continue in code
        validateStatus: (status) => true,
      ),
    );
  }

  static Future<Response> getData(
      {required String uri,
      String lang = 'en',
      String? token,
      Map<String, dynamic>? query}) async {
    LoggerHelper.loggerNoStack.i('Api Call : $uri');
    dio.options.headers = {'language': lang};
    return await dio.get(uri, queryParameters: query);
  }

  static Future<Response> postData(
      {required String uri,
      Map<String, dynamic>? data,
      String lang = 'en',
      String? token = '',
      Map<String, dynamic>? query}) async {
    LoggerHelper.loggerNoStack.i('Api Call : ' + uri);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token!,
    };
    return dio.post(uri, data: data, queryParameters: query);
  }

  static Future<Response> putData(
      {required String uri,
      Map<String, dynamic>? data,
      String lang = 'en',
      Map<String, dynamic>? query}) async {
    LoggerHelper.loggerNoStack.i('Api Call :' + uri);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return dio.put(uri, data: data, queryParameters: query);
  }
}
