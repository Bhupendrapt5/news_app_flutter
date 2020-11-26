import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_news/model/response_model.dart';

class NewsApi {
  //Initializing base URL
  final String baseURL = 'https://newsapi.org/v2/';
  Dio _dio = Dio();

  NewsApi() {
    //Initializing headers
    _dio.options.headers['Content-Type'] = 'application/json';

    _dio.options.headers['X-Api-Key'] =
        '9098215d6ffd4b78ab714da739f558cc'; //Replace with your API Key
  }

  //Calling Top HeadLines of channel name
  Future<ResponseModel> getTopHeadLines({@required String channelName}) async {
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

  //To get the news of each channel, category wise
  Future<ResponseModel> getChannelNews({
    @required String domainName,
    @required category,
  }) async {
    try {
      Response response = await _dio.get(
        baseURL + 'everything?q=$category&domains=$domainName&language=en',
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
