import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/model/category/categories.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonC.dart';
import 'package:smart_store/widget/my_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> _categoriesFuture;
  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('WE ARE HERE ssssssss');
    _categoriesFuture = CategoryApiController().indexCategory();
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
      child: FutureBuilder<List<Category>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            _categories = snapshot.data ?? [];
            return ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                Category category = _categories.elementAt(index);
                return ListTile(
                  leading: Image.asset(category.nameEn),
                  title: Text('${category.nameEn} ${category.nameAr}'),
                  subtitle: Text(category.nameEn),
                  trailing: Text('${category.productsCount}'),
                );
              },
            );
          } else if (!snapshot.hasError) {
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
      ),
    );
  }
}
/*
* GridView.builder(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                                      SizedBox(
                                          width: SizeConfig.scaleWidth(70)),
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
                                      SizedBox(
                                          width: SizeConfig.scaleWidth(90)),
                                      FavoriteButton(
                                        iconSize: 35,
                                        isFavorite: true,
                                        // iconDisabledColor: Colors.white,
                                        valueChanged: (_isFavorite) {
                                          print('Is Favorite : $_isFavorite');
                                        },
                                      ),                                    ],
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
        )*/
/*
* FutureBuilder<List<Category>>(
            future: _categoriesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                _categories = snapshot.data ?? [];
                return GridView.builder(
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
                  itemCount: _categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category category = _categories.elementAt(index);

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
                                    Image.asset(category.image),
                                  ],
                                ),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              MyText(
                                                  text:
                                                      '${category.nameEn} ${category.nameAr}',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.Auth_COLOR),
                                              SizedBox(
                                                  width: SizeConfig.scaleWidth(
                                                      70)),
                                              MyText(
                                                  text:
                                                      '${category.subCategoriesCount}',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.COLOR),
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  SizeConfig.scaleHeight(5)),
                                          MyText(
                                              text: '${category.productsCount}',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.Auth_COLOR),
                                          SizedBox(
                                              height:
                                                  SizeConfig.scaleHeight(5)),
                                          Row(
                                            children: [
                                              MyText(
                                                  text: 'Deliverd',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.Gren_Color),
                                              SizedBox(
                                                  width: SizeConfig.scaleWidth(
                                                      90)),
                                              FavoriteButton(
                                                iconSize: 35,
                                                isFavorite: true,
                                                // iconDisabledColor: Colors.white,
                                                valueChanged: (_isFavorite) {
                                                  print(
                                                      'Is Favorite : $_isFavorite');
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
                );
              } else if (snapshot.hasError) {
                print('ERROR: ${snapshot.error}');
                print('ERROR:ssssssssssss');
                return Text(('jjjjjjjjjj'));
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
          )),*/