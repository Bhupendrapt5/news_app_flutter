import 'package:my_news/model/news_model.dart';

class ResponseModel {
  final String status;
  final int statusCode;
  final List<NewsModel> articles;
  final String errorMsg;

  ResponseModel({this.status, this.statusCode, this.articles, this.errorMsg});

  factory ResponseModel.fromJson({Map<String, dynamic> json, int code}) {
    return ResponseModel(
        statusCode: code,
        status: json['status'],
        articles: (json['articles'] as List)
            .map((model) => NewsModel.fromJson(model))
            .toList(),
        errorMsg: '');
  }
  factory ResponseModel.withException({Map<String, dynamic> json, int code}) {
    return ResponseModel(
        statusCode: code,
        status: json['status'],
        articles: [],
        errorMsg: json['message']);
  }
}
