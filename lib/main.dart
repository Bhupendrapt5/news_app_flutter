import 'package:flutter/material.dart';
import 'package:my_news/dashobard.dart';
import 'package:my_news/provider/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'News Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Dashboard(),
      ),
    );
  }
}
