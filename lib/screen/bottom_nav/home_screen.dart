import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import 'package:smart_store/widget/expanded_text_field.dart';
import 'package:smart_store/widget/my_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool a = false;

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
      child: ListView(
        children: [
          SizedBox(height: SizeConfig.scaleHeight(10)),
          Container(
            height: 200,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 400 / 500,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 211,
                  width: 300,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Image.asset(
                        'images/Food banner.png',
                        fit: BoxFit.cover,
                      ),
                      // PositionedDirectional(bottom: 40,child: Text('dddd'))

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListTile(
                            onTap: () {},
                            title: MyText(
                                text: 'Fresh Sweet Truth',
                                maxLines: 1,
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: AppColors.Auth_COLOR),
                            subtitle: MyText(
                                text: 'Bakery, Desserts',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.Auth_COLOR),
                            trailing: MyText(
                                text: '300',
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: AppColors.Auth_COLOR),
                          ),
                          SizedBox(height: SizeConfig.scaleHeight(15)),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                MyText(
                    text: 'Latest Products',
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: AppColors.Auth_COLOR),
                Spacer(),
                ElevatedButtonB(
                  onPressed: () {
                    Navigator.pushNamed(context, '/PopularFoodScreen');
                  },
                  text: 'See All',
                  icon: Icons.all_inbox,
                  color: AppColors.Auth_COLOR,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 271,
            width: 500,
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 200 / 110,
              ),
              itemCount: 10,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/Rectangle 29.png'),
                        MyText(
                            text: 'Coco berry \n Salad',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.Auth_COLOR),
                        SizedBox(height: SizeConfig.scaleHeight(7)),
                        Row(
                          children: [
                            Icon(Icons.timer, color: AppColors.CloColor),
                            SizedBox(width: SizeConfig.scaleHeight(7)),
                            MyText(
                                text: '30  Min',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.CloColor),
                          ],
                        ),
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
                            Spacer(),
                            // SizedBox(width: SizeConfig.scaleWidth(50),)
                            // Icon(Icons.favorite, color: Colors.red),
                            FavoriteButton(
                              iconSize: 35,
                              isFavorite: true,
                              // iconDisabledColor: Colors.white,
                              valueChanged: (_isFavorite) {
                                print('Is Favorite : $_isFavorite');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: SizeConfig.scaleHeight(10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                MyText(
                    text: 'Products you may like',
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: AppColors.Auth_COLOR),
                Spacer(),
                ElevatedButtonB(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ProductsYouMayLikeScreen');
                  },
                  text: 'See All',
                  icon: Icons.all_inbox,
                  color: AppColors.Auth_COLOR,
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            // scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 305 / 202,
            ),
            itemCount: 2,
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.asset('images/Rectangle 2053.png'),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors.GColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: MyText(
                                  text: '1.2  KM',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.Auth_COLOR,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.scaleHeight(5)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            MyText(
                                text: 'Salad Factory',
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.Auth_COLOR),
                            Spacer(),
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
                            SizedBox(width: SizeConfig.scaleWidth(10)),
                            FavoriteButton(
                              iconSize: 35,
                              isFavorite: true,
                              // iconDisabledColor: Colors.white,
                              valueChanged: (_isFavorite) {
                                print('Is Favorite : $_isFavorite');
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.scaleHeight(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            MyText(
                                text: '2464 Royal Ln.',
                                fontSize: 15.9,
                                fontWeight: FontWeight.w600,
                                color: AppColors.Auth_COLOR),
                            Spacer(),
                            MyText(
                                text: '10:00 AM',
                                fontSize: 15.9,
                                fontWeight: FontWeight.w600,
                                color: AppColors.COLOR),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
