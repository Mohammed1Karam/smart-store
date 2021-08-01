import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/size_config.dart';

class OnBoardingContent extends StatelessWidget {
  final Color color;
  final String image;
  final String text;
  final String subText;
  final double sizedBox;

  OnBoardingContent({
    required this.color,
    required this.image,
    required this.text,
    required this.subText,
    required this.sizedBox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            // fit: BoxFit.contain,
          ),
          SizedBox(height: sizedBox),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.scaleHeight(18)),
          Text(
            subText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: SizeConfig.scaleHeight(150)),
        ],
      ),
    );
  }
}
