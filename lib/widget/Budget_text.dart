import 'package:flutter/material.dart';

class BudgetText extends StatelessWidget {
  late final String text;
  late final double fontSize;
  late final FontWeight fontWeight;
  late final Color color;

  BudgetText(
    this.text, {
    required this.fontSize,
    this.fontWeight = FontWeight.w400,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        // fontFamily: Provider.of<LanguageChangeNotifier>(context).language == 'en'
        //     ? 'SFUIDisplay'
        //     : 'Cairo',
        color: color,
      ),
    );
  }
}
