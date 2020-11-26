import 'package:flutter/material.dart';

class RobotoBoldStyle extends TextStyle {
  final double size;
  final Color fontColor;
  final String fontFam;
  final FontWeight weight;
  final double tHeight;

  const RobotoBoldStyle({
    this.size = 16,
    this.fontColor = Colors.black,
    this.fontFam = 'Roboto',
    this.weight = FontWeight.w700,
    this.tHeight = 1.5,
  })  : assert(fontColor != null && size != null),
        super(
          fontSize: size,
          color: fontColor,
          fontFamily: fontFam,
          fontWeight: weight,
          height: tHeight,
        );
}

class OpensansStyle extends TextStyle {
  final double size;
  final Color fontColor;
  final String fontFam;
  final double tHeight;

  const OpensansStyle({
    this.size = 16,
    this.fontColor = Colors.black,
    this.fontFam = 'openSans',
    this.tHeight = 1.5,
  })  : assert(fontColor != null && size != null),
        super(
            fontSize: size,
            color: fontColor,
            fontFamily: fontFam,
            height: tHeight);
}

class OpensansBoldStyle extends TextStyle {
  final double size;
  final Color fontColor;
  final String fontFam;
  final FontWeight weight;
  final double tHeight;

  const OpensansBoldStyle({
    this.size = 16,
    this.fontColor = Colors.black,
    this.fontFam = 'openSans',
    this.weight = FontWeight.w700,
    this.tHeight = 1.5,
  })  : assert(fontColor != null && size != null),
        super(
          fontSize: size,
          color: fontColor,
          fontFamily: fontFam,
          fontWeight: weight,
          height: tHeight,
        );
}

class OpensansSemiBoldStyle extends TextStyle {
  final double size;
  final Color fontColor;
  final String fontFam;
  final FontWeight weight;
  final double tHeight;

  const OpensansSemiBoldStyle({
    this.size = 16,
    this.fontColor = Colors.black,
    this.fontFam = 'openSans',
    this.weight = FontWeight.w600,
    this.tHeight = 1.5,
  })  : assert(fontColor != null && size != null),
        super(
          fontSize: size,
          color: fontColor,
          fontFamily: fontFam,
          fontWeight: weight,
          height: tHeight,
        );
}

class DancingScriptStyle extends TextStyle {
  final double size;
  final Color fontColor;
  final String fontFam;
  final double tHeight;

  const DancingScriptStyle({
    this.size = 16,
    this.fontColor = Colors.black,
    this.fontFam = 'DancingScript',
    this.tHeight = 1.5,
  })  : assert(fontColor != null && size != null),
        super(
          fontSize: size,
          color: fontColor,
          fontFamily: fontFam,
          height: tHeight,
        );
}
