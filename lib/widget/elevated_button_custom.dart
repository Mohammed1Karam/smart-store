import 'package:flutter/material.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/my_text.dart';


class ElevatedButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonTitle;
  double borderRadius;
  final double width;
  final double height;
  Color color;
  Color textColor;
  BorderSide borderSide;

  ElevatedButtonCustom({
    required this.buttonTitle,
    this.onPressed,
    required this.height,
    required this.width,
    this.borderRadius = 30,
    this.color = Colors.black,
    this.textColor = Colors.white,
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: MyText(
        text: buttonTitle,
        fontSize: 16,
        fontWeight: FontWeight.bold,

        color: textColor,
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color,
        shape: RoundedRectangleBorder(
            side:borderSide,
            borderRadius: BorderRadius.circular(borderRadius)),
        minimumSize:
        Size(SizeConfig.scaleWidth(width), SizeConfig.scaleHeight(height)),
      ),
    );
  }
}