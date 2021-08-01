import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/widget/my_text.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.COLOR,
        elevation: 0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          side: BorderSide(
            color: AppColors.COLOR,
            width: 1,
          ),
        ),
        title: MyText(
            text: 'About',
            fText: 'Merienda',
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColors.Auth_COLOR),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 290,
            right: 200,
            child: Image.asset(
              'images/Group 2683.png',
              // fit: BoxFit.cover,
              // width: double.infinity,
            ),
          ),
          Positioned(
            top: 330,
            right: 140,
            child: Row(
              children: [
                MyText(
                    text: 'Fresh',
                    fontSize: 25,
                    fText: 'Merienda',
                    fontWeight: FontWeight.w700,
                    color: AppColors.COLOR),
                MyText(
                    text: 'BOX',
                    fontSize: 25,
                    fText: 'Merienda',
                    fontWeight: FontWeight.w700,
                    color: AppColors.Auth_COLOR),
              ],
            ),
          ),
          Positioned(
            bottom: 320,
            right: 20,
            child: Row(
              children: [
                MyText(
                    text: 'Mohammed Karam – ',
                    fontSize: 25,
                    fText: 'Merienda',
                    fontWeight: FontWeight.w700,
                    color: AppColors.Auth_COLOR),
                MyText(
                    text: 'PalLancer',
                    fontSize: 25,
                    fText: 'Merienda',
                    fontWeight: FontWeight.w700,
                    color: AppColors.COLOR),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
