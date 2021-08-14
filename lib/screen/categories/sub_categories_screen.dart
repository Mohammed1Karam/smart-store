import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_store/api/controllers/sub_categories_controller.dart';
import 'package:smart_store/screen/categories/prducts_screen.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/my_text.dart';

class SubCategoriesScreen extends StatefulWidget {
 late int id;

 SubCategoriesScreen(this.id);

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  final _controller = Get.put(SubCategoriesController());
  late Future<bool> subCategoriesIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('0000000000');
    subCategoriesIndex = _controller.subCategoriesIndex(widget.id);
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
        ),
        body: FutureBuilder(
          future: Future.wait([
            subCategoriesIndex,
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
              return GridView.builder(
                shrinkWrap: true,
                primary: false,
                // scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 460 / 164,
                ),
                itemCount: _controller.subCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailesScreen(
                                _controller.subCategories[index].id)),
                      );

                      print('id    :' + _controller.subCategories[index].id.toString());
                    },
                    child: Container(
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
                                    Image.network(
                                        _controller.subCategories.value[index].imageUrl,height: 100,width: 150),
                                  ],
                                ),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              MyText(
                                                  text: _controller.subCategories
                                                      .value[index].nameEn,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.Auth_COLOR),
//                                              SizedBox(
//                                                  width: SizeConfig.scaleWidth(70)),
//                                      MyText(
//                                          text: '300',
//                                          fontSize: 17,
//                                          fontWeight: FontWeight.w600,
//                                          color: AppColors.COLOR),
                                            ],
                                          ),
//                                          SizedBox(height: SizeConfig.scaleHeight(5)),
//                                          MyText(
//                                              text: _controller
//                                                  .subCategories.value[index].nameAr,
//                                              fontSize: 16,
//                                              fontWeight: FontWeight.w400,
//                                              color: AppColors.Auth_COLOR),
//                                          SizedBox(height: SizeConfig.scaleHeight(5)),
//                                  Row(
//                                    children: [
//                                      MyText(
//                                          text: 'Deliverd',
//                                          fontSize: 15,
//                                          fontWeight: FontWeight.w600,
//                                          color: AppColors.Gren_Color),
//                                      SizedBox(width: SizeConfig.scaleWidth(90)),
//                                      FavoriteButton(
//                                        iconSize: 35,
//                                        isFavorite: true,
//                                        // iconDisabledColor: Colors.white,
//                                        valueChanged: (_isFavorite) {
//                                          print('Is Favorite : $_isFavorite');
//                                        },
//                                      ),
//                                    ],
//                                  ),
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
                    ),
                  );
                },
              );
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
        ))
      );

  }
}
/* GridView.builder(
          shrinkWrap: true,
          primary: false,
          // scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 460 / 164,
          ),
          itemCount: _controller.subCategories.length,
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
                            Image.network(
                                _controller.subCategories.value[index].imageUrl),
                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MyText(
                                          text: _controller.subCategories
                                              .value[index].nameEn,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.Auth_COLOR),
                                      SizedBox(
                                          width: SizeConfig.scaleWidth(70)),
//                                      MyText(
//                                          text: '300',
//                                          fontSize: 17,
//                                          fontWeight: FontWeight.w600,
//                                          color: AppColors.COLOR),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.scaleHeight(5)),
                                  MyText(
                                      text: _controller
                                          .subCategories.value[index].nameAr,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.Auth_COLOR),
                                  SizedBox(height: SizeConfig.scaleHeight(5)),
//                                  Row(
//                                    children: [
//                                      MyText(
//                                          text: 'Deliverd',
//                                          fontSize: 15,
//                                          fontWeight: FontWeight.w600,
//                                          color: AppColors.Gren_Color),
//                                      SizedBox(width: SizeConfig.scaleWidth(90)),
//                                      FavoriteButton(
//                                        iconSize: 35,
//                                        isFavorite: true,
//                                        // iconDisabledColor: Colors.white,
//                                        valueChanged: (_isFavorite) {
//                                          print('Is Favorite : $_isFavorite');
//                                        },
//                                      ),
//                                    ],
//                                  ),
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
        ),*/