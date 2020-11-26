import 'package:flutter/material.dart';
import 'package:my_news/helper/page_transition.dart';
import 'package:my_news/helper/text_styles.dart';
import 'package:my_news/model/response_model.dart';
import 'package:my_news/pages/news_details_page.dart';
import 'package:my_news/provider/news_provider.dart';
import 'package:my_news/widgets/app_drawer.dart';
import 'package:my_news/widgets/custom_chip_for_subcategory.dart';
import 'package:my_news/widgets/news_card_widget.dart';
import 'package:provider/provider.dart';

import '../constantans.dart';

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsProvider.currentDomain,
          style: OpensansBoldStyle(fontColor: Colors.white),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: AppBar().preferredSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: subCategory
                  .map((newsChannel) =>
                      CustomChipForSubCategory(label: newsChannel))
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: ListView.builder(
                  itemBuilder: (context, i) => ChangeNotifierProvider.value(
                    value: articles[i],
                    child: GestureDetector(
                      child: NewsCardWidget(),
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: NewsInDetail(
                              model: articles[i],
                            )));
                      },
                    ),
                  ),
                  itemCount: articles.length,
                ),
              );
            },
            future: newsProvider.getChannelNews(),
          )),
        ],
      ),
    );
  }
}
