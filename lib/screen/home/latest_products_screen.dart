import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_store/api/controllers/home_controller.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import 'package:smart_store/widget/my_text.dart';

class LatestProductsScreen extends StatefulWidget {
  @override
  _LatestProductsScreenState createState() => _LatestProductsScreenState();
}

class _LatestProductsScreenState extends State<LatestProductsScreen> {

  final _controller = Get.put(HomeController());
  late Future<bool> homeIndex;

//  late Future<bool> indexCities;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('0000000000');
    homeIndex = _controller.indexHome();
  }

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
                  text: 'Latest Products',
                  fText: 'Merienda',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.Auth_COLOR),
            ),
            body: FutureBuilder(
              future: Future.wait([
                homeIndex,
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child:  CircularPercentIndicator(
                    radius: 130.0,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 15.0,
                    percent: 0.4,
                    center: new Image.asset('images/Unhappy.png',width: 80,),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor:AppColors.GColor,
                    progressColor: AppColors.COLOR,
                  ));
                } else if (snapshot.hasData) {
                  return ListView(
                    children: [
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          // scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 234 / 291,
                          ),
                          itemCount:
                              _controller.HomeOpj.value!.categories.length,
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
                                    Center(
                                        child: Image.network(_controller
                                            .HomeOpj
                                            .value!
                                            .categories[index]
                                            .imageUrl)),
                                    MyText(
                                        text: _controller.HomeOpj.value!
                                            .categories[index].nameEn,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.Auth_COLOR),
                                    SizedBox(height: SizeConfig.scaleHeight(5)),
                                    Row(
                                      children: [
                                        Icon(Icons.timer,
                                            color: AppColors.CloColor),
                                        SizedBox(
                                            width: SizeConfig.scaleHeight(5)),
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
                                        SizedBox(
                                            width: SizeConfig.scaleHeight(5)),
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
                    ],
                  );
                } else if (snapshot.hasError) {
                  print('ERROR: ${snapshot.error}');
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.warning, size: 20),
                        SizedBox(height: 20),
                        Text(
                          'NO DATA',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.warning, size: 70),
                        SizedBox(height: 10),
                        Text(
                          'NO DATA',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            )));
  }
}
/*,*/
