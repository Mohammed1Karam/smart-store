import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/my_text.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.HomeColor,
            AppColors.HomeColor,
            AppColors.HomeColor,
          ],
        ),
      ),
      child: Scaffold(
        body: GridView.builder(
          shrinkWrap: true,
          primary: false,
          // scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 325 / 115,
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
                      child: TextButton(
                          onPressed: () {}, child: Icon(Icons.clear,color: AppColors.RED_Color)),
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
                                SizedBox(width: SizeConfig.scaleHeight(7)),
                                MyText(
                                    text: '4.3',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.Auth_COLOR),
                                SizedBox(width: SizeConfig.scaleHeight(90)),
                                Icon(Icons.timer, color: AppColors.CloColor),
                                SizedBox(width: SizeConfig.scaleHeight(7)),
                                MyText(
                                    text: '30  Min',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.CloColor),
                              ],
                            )
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
      ),
    );
  }
}
