import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smart_store/utils/size_config.dart';

class MyText extends StatelessWidget {
  final String text;
  final String fText;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;

  MyText({
    required this.text,
    this.fText = 'Montserrat',
    required this.fontSize,
    required this.fontWeight,
    required this.color,
     this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: SizeConfig.scaleTextFont(fontSize),
        fontFamily: fText,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
