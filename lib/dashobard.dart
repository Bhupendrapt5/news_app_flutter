import 'package:flutter/material.dart';
import 'package:my_news/constantans.dart';
import 'package:my_news/model/response_model.dart';
import 'package:my_news/provider/news_provider.dart';
import 'package:my_news/widgets/custom_chip.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: AppBar().preferredSize.height * 1.2,
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: sources.keys
                  .map((newsChannel) => CustomChip(label: newsChannel))
                  .toList(),
            ),
          ),
          Expanded(
              child: FutureBuilder<ResponseModel>(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var articles = snapshot.data.articles;
              return ListView.builder(
                itemBuilder: (context, i) => ListTile(
                  title: Text(articles[i].title),
                ),
                itemCount: articles.length,
              );
            },
            future: newsProvider.getHeadLines(),
          )),
        ],
      ),
    );
  }
}
