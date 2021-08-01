import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/Budget_text.dart';

class PinButton extends StatelessWidget {
  late final String text;
  late final Function() onPressed;
  late final double widthMultiply;

  PinButton({
    required this.text,
    required this.onPressed,
    required this.widthMultiply,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.scaleWidth(70) * widthMultiply,
      height: SizeConfig.scaleHeight(70),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          child: BudgetText(
            text,
            fontSize: SizeConfig.scaleTextFont(20),
            color: AppColors.AppMainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
