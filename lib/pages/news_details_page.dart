import 'package:flutter/material.dart';
import 'package:my_news/helper/text_styles.dart';
import 'package:my_news/helper/utility.dart';
import 'package:my_news/model/news_model.dart';
import 'package:my_news/widgets/platform_circle_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsInDetail extends StatelessWidget {
  final NewsModel model;
  final _utility = Utility();

  NewsInDetail({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.source.sourceName,
          style: OpensansBoldStyle(fontColor: Colors.white),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                height: Utility().getSize(context).height * 0.25,
                child: Stack(
                  children: [
                    PlatformCircularProgressIndicator().show(context),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: model.urlToImage,
                      width: double.infinity,
                      height: Utility().getSize(context).height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Source - ',
                          style: OpensansStyle(
                              size: 10 * _utility.getTexfactor(context)),
                          children: <TextSpan>[
                            TextSpan(
                              text: model.source.sourceName,
                              style: OpensansBoldStyle(
                                size: 12 * _utility.getTexfactor(context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        _utility.getReadableText(date: model.publishedAt),
                        style: OpensansStyle(
                            size: 12 * _utility.getTexfactor(context)),
                      ),
                    ],
                  ),
                  Text(
                    model.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: OpensansBoldStyle(
                      size: 15 * _utility.getTexfactor(context),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
