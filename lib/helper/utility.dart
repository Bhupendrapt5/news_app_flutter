import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

class Utility {
  Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double getTexfactor(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }

  String getReadableText({String date}) {
    var localDate = DateTime.parse(date).toLocal();
    return DateFormat.jm().addPattern('dd-MMM-yy').format(localDate);
  }

  String parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }
}
