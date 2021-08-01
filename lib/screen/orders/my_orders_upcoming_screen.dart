import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonC.dart';
import 'package:smart_store/widget/my_text.dart';

class MyOrdersUpcomingScreen extends StatefulWidget {
  const MyOrdersUpcomingScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersUpcomingScreenState createState() => _MyOrdersUpcomingScreenState();
}

class _MyOrdersUpcomingScreenState extends State<MyOrdersUpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
      primary: false,
      // scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 325 / 164,
      ),
      itemCount: 6,
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/Shop-logo.png'),
                      ],
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  MyText(
                                      text: 'Starbucks',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.Auth_COLOR),
                                  SizedBox(width: SizeConfig.scaleWidth(70)),
                                  MyText(
                                      text: '300',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.COLOR),
                                ],
                              ),
                              SizedBox(height: SizeConfig.scaleHeight(5)),
                              MyText(
                                  text: '17 Jan, 02:30. 3 items',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.Auth_COLOR),
                              SizedBox(height: SizeConfig.scaleHeight(5)),
                              MyText(
                                  text: 'Deliverd',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Gren_Color),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButtonC(onPressed: () {}, text: 'Track Order',color: AppColors.GColor),
                    SizedBox(width: SizeConfig.scaleWidth(15)),
                    ElevatedButtonC(onPressed: () {}, text: 'Cancel',color: AppColors.COLOR),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
