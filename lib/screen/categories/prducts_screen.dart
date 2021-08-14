import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_store/api/controllers/product_controller.dart';
import 'package:smart_store/model/home/base_home.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonB.dart';
import 'package:smart_store/widget/my_text.dart';

class ProductDetailesScreen extends StatefulWidget {
  late int id;

  ProductDetailesScreen(this.id);

  @override
  _ProductDetailesScreenState createState() => _ProductDetailesScreenState();
}

class _ProductDetailesScreenState extends State<ProductDetailesScreen> {
  final ProductGX = Get.put(ProductController());
  late Future<bool> productDetailsIndex;
  List<Home> _home = <Home>[];

//  late Future<bool> indexCities;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('0000000000');
    productDetailsIndex = ProductGX.productIndex(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    late Color color = Colors.grey;
    final PageController controller = PageController(initialPage: 0);
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
//          backgroundColor: AppColors.COLOR,
          appBar: AppBar(
            backgroundColor: AppColors.COLOR,
            elevation: 0,
            centerTitle: true,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.vertical(
//                bottom: Radius.circular(30),
//              ),
//              side: BorderSide(
//                color: AppColors.COLOR,
//                width: 1,
//              ),
//            ),
            title: MyText(
                text: 'Product',
                fText: 'Merienda',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.Auth_COLOR),
          ),
          body: FutureBuilder(
            future: Future.wait([
              productDetailsIndex,
            ]),
//            future: productDetailsIndex,
            builder: (context, snapshot) {
              int i = 0;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularPercentIndicator(
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
              } else if (snapshot.hasError) {
                return Center(child: Text('Error 1'));
              } else if (snapshot.hasData) {
                return Obx(() => ListView(
                      children: [
//                        ElevatedButtonB(
//                            onPressed: () {
//                              ProductGX.products.length;
//                            },
//                            text: 'text'),
                        SizedBox(
                          height: SizeConfig.scaleHeight(300),
                          width: SizeConfig.scaleWidth(200),
                          child: PageView(
                            scrollDirection: Axis.horizontal,
                            controller: PageController(
                              viewportFraction: 1.5,
                              initialPage: 1,
                            ),
                            children: <Widget>[
                              ClipRRect(
                                  child: Image.network(
                                ProductGX.products[i].imageUrl,
                                fit: BoxFit.fill,
                                width: SizeConfig.scaleWidth(280),
                                height: SizeConfig.scaleHeight(280),
                              )),
                              ClipRRect(
                                  child: Image.network(
                                ProductGX.products[i].imageUrl,
                                fit: BoxFit.fill,
                                width: SizeConfig.scaleWidth(280),
                                height: SizeConfig.scaleHeight(280),
                              )),
                              ClipRRect(
                                  child: Image.network(
                                ProductGX.products[i].imageUrl,
                                fit: BoxFit.fill,
                                width: SizeConfig.scaleWidth(280),
                                height: SizeConfig.scaleHeight(280),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(50),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))
                              // border: Border.all(width: 5.0, color: Colors.white),
                              ),
                          width: double.infinity,
                          height: SizeConfig.scaleHeight(451),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.scaleWidth(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: SizeConfig.scaleHeight(30),
                                ),
                                Text(
                                  ProductGX.products[i].nameEn,
                                  style: TextStyle(
                                    color: AppColors.Auth_COLOR,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.scaleTextFont(20),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${ProductGX.products[i].price}',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.scaleTextFont(20),
                                          color: AppColors.Auth_COLOR,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        AddFovorate(ProductGX.products[i].id);
                                        ProductGX.products.refresh();
                                        ProductGX.products[i].isFavorite
                                            ? color = Colors.grey
                                            : color = Colors.red;
                                        print(color);
                                        print(ProductGX.products[i].isFavorite);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: color,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: SizeConfig.scaleHeight(70),
                                  child: Text('${ProductGX.products[i].infoEn}',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.Auth_COLOR,
                                      )),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(10),
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        //  size: 1,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text('Rate : ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.Auth_COLOR,
                                            )),
                                        Text('3/5 ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.Auth_COLOR,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(20),
                                ),
                                Row(
                                  children: [
                                    Text('Available: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.Auth_COLOR,
                                        )),
                                    Text(
                                        ProductGX.products[i].quantity
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.Auth_COLOR,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(80),
                                ),
                                ElevatedButtonB(
                                    onPressed: () {},
                                    text: 'Add',
                                    icon: Icons.add,
                                    color: AppColors.COLOR)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              } else {
                return Center(child: Text('Error....'));
              }
            },
          )),
    );
  }

  Future AddFovorate(int id_product) async {
//    await ProductGX.toggleFavoriteState(id_product);
//    await favoriteaGX.AddToFavorate(context, product_id: id_product);
  }
}
/*
* ListView(
                      children: [
                        SizedBox(
                          height: SizeConfig.scaleHeight(300),
                          width:  SizeConfig.scaleWidth(300),
                          child: PageView(
                            scrollDirection: Axis.horizontal,
                            controller: PageController(
                              viewportFraction: 1.5,
                              initialPage: 1,
                            ),
                            children: <Widget>[
                              ClipRRect(
                                  child: Image.network(
                                ProductGX.products[0].imageUrl,
                                fit: BoxFit.fill,
                                width: SizeConfig.scaleWidth(280),
                                height: SizeConfig.scaleHeight(280),
                              )),
                              ClipRRect(
                                  child: Image.network(
                                ProductGX.products[1].imageUrl,
                                fit: BoxFit.fill,
                                width: SizeConfig.scaleWidth(280),
                                height: SizeConfig.scaleHeight(280),
                              )),

                              ClipRRect(
                                  child: Image.network(
                                ProductGX.products[2].imageUrl,
                                fit: BoxFit.fill,
                                width: SizeConfig.scaleWidth(280),
                                height: SizeConfig.scaleHeight(280),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(50),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))
                              // border: Border.all(width: 5.0, color: Colors.white),
                              ),
                          width: double.infinity,
                          height: SizeConfig.scaleHeight(451),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.scaleWidth(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: SizeConfig.scaleHeight(30),
                                ),
                                Text(
                                  ProductGX.products[i].nameEn,
                                  style: TextStyle(
                                    color: AppColors.Auth_COLOR,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.scaleTextFont(20),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${ProductGX.products[i].price}',
                                      style: TextStyle(
                                          fontSize: SizeConfig.scaleTextFont(20),
                                          color: AppColors.Auth_COLOR,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        AddFovorate(ProductGX.products[i].id);
                                        ProductGX.products.refresh();
                                        ProductGX.products[i].isFavorite
                                            ? color = Colors.grey
                                            : color = Colors.red;
                                        print(color);
                                        print(ProductGX.products[i].isFavorite);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: color,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: SizeConfig.scaleHeight(70),
                                  child: Text('${ProductGX.products[i].infoEn}',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.Auth_COLOR,
                                      )),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(10),
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        //  size: 1,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text('Rate : ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.Auth_COLOR,
                                            )),
                                        Text('3/5 ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.Auth_COLOR,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(20),
                                ),
                                Row(
                                  children: [
                                    Text('Available: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.Auth_COLOR,
                                        )),
                                    Text(
                                        ProductGX.products[i].quantity.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.Auth_COLOR,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(80),
                                ),
                                ElevatedButtonB(
                                    onPressed: () {},
                                    text: 'Add',
                                    icon: Icons.add,
                                    color: AppColors.COLOR)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));*/
