import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonD.dart';
import 'package:smart_store/widget/expanded_text_field.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:badges/badges.dart';
import 'package:favorite_button/favorite_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            text: 'Cart',
            fText: 'Merienda',
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColors.Auth_COLOR),
        actions: [
          Card(
            elevation: 5,
            color: AppColors.COLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: AppColors.Auth_COLOR, width: 1.5),
            ),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Badge(
                    badgeColor: AppColors.White_COLOR,
                    badgeContent: Text('3'),
                    child: Icon(Icons.notification_important_outlined),
                  ),
                  color: AppColors.White_COLOR,
                  onPressed: () {
                    Navigator.pushNamed(context, '/NotificationScreen');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        primary: false,
        // scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 290 / 130,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.White_COLOR,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                ++_counter;
                              });
                            },
                            icon: Icon(Icons.add,
                                color: AppColors.TextMainColor)),
                        Card(
                          elevation: 3,
                          color: AppColors.W200_COLOR,
                          child: Container(
                            height: 30,
                            width: 20,
                            child: Center(
                              child: MyText(
                                  text: _counter.toString(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Auth_COLOR),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                --_counter;
                              });
                            },
                            icon:
                                Icon(Icons.remove, color: AppColors.RED_Color)),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/Rectangle 2449.png'),
                        ),
                        Positioned(
                          top: 15,
                          left: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.COLOR,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.local_activity_outlined),
                                MyText(
                                    text: '-60',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.WiteColor),
                              ],
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(width: SizeConfig.scaleWidth(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              text: '10',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.COLOR),
                          SizedBox(height: SizeConfig.scaleHeight(5)),
                          MyText(
                              text: 'Grilled Sandwitch',
                              fontSize: 20,
                              maxLines: 1,
                              fontWeight: FontWeight.w600,
                              color: AppColors.Auth_COLOR),
                          SizedBox(height: SizeConfig.scaleHeight(11)),
                          Row(
                            children: [
                              StarButton(
                                iconSize: 35,
                                isStarred: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isStarred) {
                                  print('Is Starred : $_isStarred');
                                },
                              ),
                              SizedBox(width: SizeConfig.scaleHeight(5)),
                              MyText(
                                  text: '4.3',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Auth_COLOR),
                            ],
                          ),
                          SizedBox(height: SizeConfig.scaleHeight(5)),
                          Row(
                            children: [
                              Icon(Icons.timer, color: AppColors.CloColor),
                              SizedBox(width: SizeConfig.scaleWidth(2)),
                              MyText(
                                  text: '30  Min',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.CloColor),
                              SizedBox(width: SizeConfig.scaleWidth(50)),
                              ElevatedButtonD(onPressed: () {}, text: 'add',color: AppColors.COLOR,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
