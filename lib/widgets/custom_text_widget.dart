import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const CustomTextWidget({
    Key key,
    @required this.text,
    this.size = 20,
    this.color = Colors.blueGrey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
        fontSize: _heigth * size,
        color: color,
        height: 1.5,
      ),
    );
  }
}
