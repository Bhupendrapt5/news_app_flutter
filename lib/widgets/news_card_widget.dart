import 'package:flutter/material.dart';
import 'package:my_news/helper/text_styles.dart';
import 'package:my_news/helper/utility.dart';
import 'package:my_news/model/news_model.dart';
import 'package:my_news/widgets/platform_circle_indicator.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsCardWidget extends StatelessWidget {
  final _utility = Utility();
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsModel>(
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 53, 156, 0.22),
                offset: Offset(0, 0),
                blurRadius: 4.0,
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    model.description ?? model.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: OpensansStyle(
                      size: 12 * _utility.getTexfactor(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
