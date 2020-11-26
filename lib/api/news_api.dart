import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_news/model/response_model.dart';

class NewsApi {
  final Map<String, String> header = {
    'Content-Type': 'application/json',
    //API key [https://newsapi.org]
    'X-Api-Key': '9098215d6ffd4b78ab714da739f558cc',
  };

  final String baseURL = 'https://newsapi.org/v2/';
  Dio _dio = Dio();

  Future<ResponseModel> getTopHeadLines({@required String channelName}) async {
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['X-Api-Key'] = '9098215d6ffd4b78ab714da739f558cc';
    try {
      Response response = await _dio.get(
        baseURL + 'top-headlines?sources=$channelName',
      );
      return ResponseModel.fromJson(
          code: response.statusCode, json: response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withException(
          code: 400,
          json: {'status': '$error', 'message': 'Something went wrong'});
    }
  }
}
