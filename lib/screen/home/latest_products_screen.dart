import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import 'package:smart_store/widget/my_text.dart';

class LatestProductsScreen extends StatefulWidget {
  @override
  _LatestProductsScreenState createState() => _LatestProductsScreenState();
}

class _LatestProductsScreenState extends State<LatestProductsScreen> {
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
        // backgroundColor: AppColors.WiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.WiteColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.Auth_COLOR),
          title: MyText(
              text: 'Popular Food',
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.Auth_COLOR),
        ),
        body: ListView(
          children: [
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                // scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 164 / 261,
                ),
                itemCount: 4,
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
                          SizedBox(height: SizeConfig.scaleHeight(5)),
                          Row(
                            children: [
                              Icon(Icons.timer, color: AppColors.CloColor),
                              SizedBox(width: SizeConfig.scaleHeight(5)),
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
                              ),                              SizedBox(width: SizeConfig.scaleHeight(5)),
                              MyText(
                                  text: '4.3',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Auth_COLOR),
                              Spacer(),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  MyText(
                      text: 'Recommended',
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: AppColors.Auth_COLOR),
                  Spacer(),
                  ElevatedButtonB(
                    onPressed: () {},
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
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 330 / 195,
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset('images/Veg biryani.png'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                text: 'Fresh Veg-Salad',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.Auth_COLOR),
                            SizedBox(height: SizeConfig.scaleHeight(5)),

                            MyText(
                                text: 'Fresh Salad with \n Green berry',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.Auth_COLOR),
                            SizedBox(height: SizeConfig.scaleHeight(11)),

                            MyText(
                                text: '8.99',
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: AppColors.COLOR),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
