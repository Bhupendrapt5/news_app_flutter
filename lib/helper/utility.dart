import 'package:flutter/material.dart';
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
}
