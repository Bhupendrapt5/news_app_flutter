import 'package:flutter/material.dart';
import 'package:my_news/provider/news_provider.dart';
import 'package:provider/provider.dart';

class CustomChipForSubCategory extends StatelessWidget {
  final String label;

  const CustomChipForSubCategory({Key key, @required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) => Container(
        padding: const EdgeInsets.all(8.0),
        child: ChoiceChip(
          elevation: 2,
          label: Text(label),
          labelStyle: TextStyle(
            color: newsProvider.newsCategory == label
                ? Colors.white
                : Colors.blueGrey,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white70,
          selectedColor: Colors.blueGrey,
          selected: newsProvider.newsCategory == label,
          onSelected: (selected) {
            newsProvider.setNewsCategory(label);
          },
        ),
      ),
    );
  }
}
