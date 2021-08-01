import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';

class ElevatedButtonA extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? color;
  final IconData? icon;


  ElevatedButtonA({
   required this.onPressed,
   required this.text,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size(double.infinity, SizeConfig.scaleHeight(50)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      label: Text(
        text,
        style: TextStyle(
          color: AppColors.White_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
