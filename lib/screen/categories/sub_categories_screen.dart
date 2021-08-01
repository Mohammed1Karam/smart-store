import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/my_text.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
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
              text: 'Sub Categories',
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

            )
          ],
        ),
        body: GridView.builder(
          shrinkWrap: true,
          primary: false,
          // scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 405 / 144,
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
                                  Row(
                                    children: [
                                      MyText(
                                          text: 'Deliverd',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Gren_Color),
                                      SizedBox(width: SizeConfig.scaleWidth(90)),
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
                                ],
                              ),
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
      ),
    );
  }
}
