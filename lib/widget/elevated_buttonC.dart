import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';

class ElevatedButtonC extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? color;


  ElevatedButtonC({
   required this.onPressed,
   required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size(SizeConfig.scaleWidth(136), SizeConfig.scaleHeight(35)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:  Text(
        text,
        style: TextStyle(
          color: AppColors.White_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
