import 'package:flutter/material.dart';
import 'package:my_news/api/news_api.dart';
import 'package:my_news/constantans.dart';
import 'package:my_news/model/response_model.dart';

class NewsProvider with ChangeNotifier {
  String _newsChannel = 'Buzzfeed';

  String get getChannel => _newsChannel;

  void setChannel(String newChannel) {
    _newsChannel = newChannel;
    getHeadLines();
    notifyListeners();
  }

  String _domainName = '';
  String get currentDomain => _domainName;

  void setDomainName(String domain) {
    _domainName = domain;
  }

  String _category = 'Business';

  String get newsCategory => _category;

  void setNewsCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void resetCategory() {
    _category = 'Business';
  }

  final NewsApi _newsApi = NewsApi();

  Future<ResponseModel> getHeadLines() {
    return _newsApi.getTopHeadLines(channelName: sources[getChannel]);
  }

  Future<ResponseModel> getChannelNews() {
    return _newsApi.getChannelNews(
        category: newsCategory, domainName: domainsMap[currentDomain]);
  }
}
