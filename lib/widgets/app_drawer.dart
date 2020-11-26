import 'package:flutter/material.dart';
import 'package:my_news/helper/custom_splash_facotry.dart';
import 'package:my_news/helper/page_transition.dart';
import 'package:my_news/pages/channel_page.dart';
import 'package:my_news/pages/dashobard.dart';
import 'package:my_news/provider/news_provider.dart';
import 'package:provider/provider.dart';

import 'custom_text_widget.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: _heigth * 0.02, vertical: _heigth * 0.03),
              child: CustomTextWidget(
                text: 'My News',
                size: 0.04,
              ),
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'Top Headline',
              onTap: () {
                newsProvider.resetCategory();
                newsProvider.setDomainName('');
                Navigator.push(
                  context,
                  SlideRightRoute(page: Dashboard()),
                );
              },
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'CNN',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'CBS News',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'Buzzfeed',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'ESPN',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'Fox News',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'MSNBC',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'AP',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'TIME',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'The Times of India',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'The Hindu',
              context: context,
              newsProvider: newsProvider,
            ),
            Divider(
              thickness: 1,
            ),
            _customInkwellContainer(
              label: 'Google News (IN)',
              context: context,
              newsProvider: newsProvider,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customInkwellContainer(
      {String label,
      BuildContext context,
      NewsProvider newsProvider,
      VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        splashFactory: CustomSplashFactory(),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
        highlightColor: Colors.transparent,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: CustomTextWidget(
              text: label,
              size: 0.02,
            ),
          ),
        ),
        onTap: onTap ??
            () {
              newsProvider.resetCategory();
              newsProvider.setDomainName(label);
              Navigator.push(
                context,
                SlideRightRoute(page: ChannelPage()),
              );
            },
      ),
    );
  }
}
