import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/Budget_text.dart';

// ignore: must_be_immutable
class AppElevatedButton extends StatelessWidget {
  late final String text;
  late Function() onPressed;

  late Color color;

  AppElevatedButton(
      {required this.text,
      required this.onPressed,
      this.color = AppColors.AppMainColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minimumSize: Size(double.infinity, SizeConfig.scaleHeight(55))),
      child: BudgetText(
        text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
