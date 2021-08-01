import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/my_text.dart';

class ProductsYouMayLikeScreen extends StatefulWidget {
  const ProductsYouMayLikeScreen({Key? key}) : super(key: key);

  @override
  _ProductsYouMayLikeScreenState createState() => _ProductsYouMayLikeScreenState();
}

class _ProductsYouMayLikeScreenState extends State<ProductsYouMayLikeScreen> {
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
          elevation: 0,
          backgroundColor: AppColors.WiteColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.Auth_COLOR),
          title: MyText(
              text: 'Products you may like',
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.Auth_COLOR),
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
      ),
    );
  }
}
