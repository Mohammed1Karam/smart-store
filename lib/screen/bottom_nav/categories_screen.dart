import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/screen/categories/sub_categories_screen.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import '../../api/controllers/categories_controller.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/widget/my_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _controller = Get.put(CategoriesController());
  late Future<bool> categoriesIndex;

//  late Future<bool> indexCities;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('0000000000');
    categoriesIndex = _controller.categoriesIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
//      child: Obx(() {
//    child: ElevatedButtonB (
//            onPressed: () {
//              print ( '_controller :${controller.categories.length}' );
//            },
//            text: 'llll' ),
//      child: InkWell(
//        onTap: (){
//          MaterialPageRoute(builder: (context) => SubCategoriesScreen(controller.categories[])),
//        },
        child: FutureBuilder(
          future: Future.wait([
            categoriesIndex,
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
                center: new Image.asset(
                  'images/Unhappy.png',
                  width: 80,
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: AppColors.GColor,
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
//                  childAspectRatio: 200 / 210,
                  childAspectRatio: 460 / 164,

                ),
                itemCount: _controller.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubCategoriesScreen(
                                _controller.categories[index].id)),
                      );

                      print('id' + _controller.categories[index].id.toString());
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
                        child: Row(
                          children: [
                            Image.network(
                                _controller.categories.value[index].imageUrl),
                            MyText(
                                text:
                                    _controller.categories.value[index].nameEn,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.Auth_COLOR),
//                                  MyText(
//                                      text: controller
//                                          .categories.value[index].productsCount
//                                          .toString(),
//                                      fontSize: 17,
//                                      fontWeight: FontWeight.w600,
//                                      color: AppColors.COLOR),
                            SizedBox(height: SizeConfig.scaleHeight(5)),
//                            MyText(
//                                text:
//                                    _controller.categories.value[index].nameAr,
//                                fontSize: 15,
//                                fontWeight: FontWeight.w600,
//                                color: AppColors.Gren_Color),
                            SizedBox(height: SizeConfig.scaleHeight(5)),
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
        ));

//      }),
  }
}
/*
* GridView.builder(
        shrinkWrap: true,
        primary: false,
        // scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 200 / 210,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  SubCategoriesScreen(controller.categories[index].id)),);

              print('id' + controller.categories[index].id.toString());
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
                    Image.network(controller.categories.value[index].imageUrl),
                    MyText(
                        text: controller.categories.value[index].nameEn,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.Auth_COLOR),
//                                  MyText(
//                                      text: controller
//                                          .categories.value[index].productsCount
//                                          .toString(),
//                                      fontSize: 17,
//                                      fontWeight: FontWeight.w600,
//                                      color: AppColors.COLOR),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    MyText(
                        text: controller.categories.value[index].nameAr,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.Gren_Color),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                  ],
                ),
              ),
            ),
          );
        },
      ),*/
