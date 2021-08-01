import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import 'package:smart_store/widget/elevated_buttonC.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:store_redirect/store_redirect.dart';

class MyOrdersHistoryScreen extends StatefulWidget {
  const MyOrdersHistoryScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersHistoryScreenState createState() => _MyOrdersHistoryScreenState();
}

class _MyOrdersHistoryScreenState extends State<MyOrdersHistoryScreen> {
  final _dialog = RatingDialog(
//   // your app's name?
    title: 'Rating',
//   // encourage your user to leave a high rating?
    message: 'Tap a star to set your rating.',

    submitButton: 'Submit',
//   onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      //  print('rating: ${response.rating}, comment: ${response.comme
      // // TODO: add your own logic
      if (response.rating < 3.6) {
        // Il send their comments to your email or anywhere you wish
        // 11 ask the user to contact you instead of leaving a bad rev:
      } else {
        //go to app store
        StoreRedirect.redirect(
            androidAppId: 'com.example.smart_store',
            iOSAppId: 'com.example.smartStore');
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                Row(
                  children: [
                    ElevatedButtonC(
                        onPressed: () {},
                        text: 'Re-order',
                        color: AppColors.COLOR),
                    SizedBox(width: SizeConfig.scaleWidth(15)),
                    ElevatedButtonC(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => _dialog,
                          );
                        },
                        text: 'Rate',
                        color: AppColors.GColor),
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
