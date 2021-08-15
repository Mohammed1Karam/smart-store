import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';

//import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_store/api/controllers/home_controller.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import 'package:smart_store/widget/my_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());
  late Future<bool> homeIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('0000000000');
    homeIndex = _controller.indexHome();
  }

  final List<String> imageList = [
//    "images/Rectangle 2053.png",
//    "images/happys.png",
//    "images/Food banner.png"
  ];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < _controller.HomeOpj.value!.latestProducts.length; i++) {
      imageList.insert(i, _controller.HomeOpj.value!.latestProducts[i].imageUrl);
    }
    final orientation = MediaQuery.of(context).orientation;
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
        child: FutureBuilder(
          future: Future.wait([
            homeIndex,
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularPercentIndicator(
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
                SizedBox(height: SizeConfig.scaleHeight(10)),
//                SizedBox(
//                  height: SizeConfig.scaleHeight(190),
//                  width: double.infinity,
//                  child: CarouselSlider(
//                    options: CarouselOptions(
//                      enlargeCenterPage: true,
//                      enableInfiniteScroll: false,
//                      autoPlay: true,
//                    ),
//                    items: imageList
//                        .map((e) => ClipRRect(
//                              borderRadius: BorderRadius.circular(8),
//                              child: Stack(
//                                fit: StackFit.expand,
//                                children: <Widget>[
//                                  Image.network(
//                                    e,
//                                    width: 1050,
//                                    height: 350,
//                                    fit: BoxFit.fill,
//                                  )
//                                ],
//                              ),
//                            ))
//                        .toList(),
//                  ),
//                ),
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
                      childAspectRatio: 240 / 120,
                    ),
                    itemCount: _controller.HomeOpj.value!.categories.length,
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
                                  child: Image.network(_controller.HomeOpj
                                      .value!.categories[index].imageUrl)),
                              SizedBox(height: SizeConfig.scaleHeight(7)),
                              MyText(
                                  text: _controller
                                      .HomeOpj.value!.categories[index].nameEn,
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
                          Navigator.pushNamed(
                              context, '/ProductsYouMayLikeScreen');
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
                    childAspectRatio: 305 / 170,
                  ),
                  itemCount: _controller.HomeOpj.value!.latestProducts.length,
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
                                Image.network(_controller.HomeOpj.value!
                                    .latestProducts[index].imageUrl),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: AppColors.GColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text:
                                            '${_controller.HomeOpj.value!.latestProducts[index].price} USD',
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  MyText(
                                      text: _controller.HomeOpj.value!
                                          .latestProducts[index].nameEn,
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
//                            Padding(
//                              padding: EdgeInsets.symmetric(horizontal: 12),
//                              child: Row(
//                                children: [
////                                  MyText(
////                                      text: _controller.HomeOpj.value!
////                                          .latestProducts[index].infoEn,
////                                      fontSize: 15.9,
////                                      fontWeight: FontWeight.w600,
////                                      color: AppColors.Auth_COLOR),
////                                  Spacer(),
//                                  MyText(
//                                      text: '10:00 AM',
//                                      fontSize: 15.9,
//                                      fontWeight: FontWeight.w600,
//                                      color: AppColors.COLOR),
//                                ],
//                              ),
//                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]);
            } else if (snapshot.hasError) {
              print('ERROR: ${snapshot.error}');
              return Center(
                child: Column(
                  children: [
                    Icon(Icons.warning, size: 70),
                    SizedBox(height: 20),
                    Text(
                      'NO DATA',
                      style: TextStyle(
                        color: Colors.white,
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
        ));
  }
}
/*,*/
