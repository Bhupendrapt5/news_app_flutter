import 'package:flutter/material.dart';
import 'package:my_news/api/news_api.dart';
import 'package:my_news/constantans.dart';
import 'package:my_news/model/response_model.dart';

class NewsProvider with ChangeNotifier {
  String _newsChannel = 'CNN';

  String get getChannel => _newsChannel;

  void setChannel(String newChannel) {
    _newsChannel = newChannel;
    getHeadLines();
    notifyListeners();
  }

  final NewsApi _newsApi = NewsApi();

  Future<ResponseModel> getHeadLines() {
    return _newsApi.getTopHeadLines(channelName: sources[getChannel]);
  }
}
