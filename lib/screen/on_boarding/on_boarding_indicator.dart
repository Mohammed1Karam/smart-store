import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';

class OnBoardingIndicator extends StatelessWidget {
  final bool selected;

  OnBoardingIndicator({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: selected ? AppColors.COLOR : AppColors.W_COLOR,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
        border: !selected ? Border.all(color: AppColors.COLOR, width: 0) : null,
      ),
    );
  }
}

/*Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      width: 12,
      height: 12,
      decoration: BoxDecoration(

        color: selected? Colors.red : Colors.grey,
        shape: BoxShape.circle,
        border: !selected? Border.all(color: Colors.black,width: 2) : null,
      ),
    );*/
