import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_store/api/controllers/AddressesController.dart';
import 'package:smart_store/api/controllers/CitiesController.dart';
import 'package:smart_store/screen/settings/address/add_address_screen.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonC.dart';
import 'package:smart_store/widget/list_tile_setting.dart';
import 'package:smart_store/widget/my_text.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  _AddressesScreenState createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final addressesGX = Get.put(AddressesController());
  final citiesGX =  Get.find<CityController>();

//  final citiesGX=Get.find<CityController>();

  late Future<bool> indexAddresses;
  late Future<bool> indexCities;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('0000000000');

//     if(Get.isRegistered<CityController>()){
//       print('111111ddddddd1111');
//       Get.find<CityController>();
//     }else{
//       print('22222222222');
//
//       Get.put(CityController());
//     }

    indexAddresses = addressesGX.addressesIndex();
    indexCities = citiesGX.citiesIndex();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([indexAddresses, indexCities]),
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
        } else if (snapshot.hasError) {
          return Center(child: Text('Error'));
        } else if (snapshot.hasData) {
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
                  AppColors.HomeColor,
                  AppColors.HomeColor,
                  AppColors.HomeColor,
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
                actions: [
//                  IconButton(
//                      onPressed: () {
//                        Navigator.of(context).push(MaterialPageRoute(
//                            builder: (context) => AddAddressScreen()));
//                      },
//                      icon: Icon(Icons.add)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddAddressScreen()));
                          },
                          icon: Icon(Icons.add)),
                    ),
                  ),
                ],
                title: MyText(
                    text: 'Addresses',
                    fText: 'Merienda',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.Auth_COLOR),
              ),
              body: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(10)),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.white
                            ],
                            stops: [
                              0.0,
                              0.03,
                              0.97,
                              1.0
                            ], // 10% purple, 80% transparent, 10% purple
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: Obx(
                          () => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.scaleHeight(15)),
                              itemCount: addressesGX.addresses.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: SizeConfig.scaleHeight(20)),
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            MyText(
                                                text: addressesGX
                                                    .addresses[index].name,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.Auth_COLOR),
                                            Spacer(),
                                            MyText(
                                                text: addressesGX
                                                    .addresses[index]
                                                    .contactNumber,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Auth_COLOR),
                                          ],
                                        ),
                                        SizedBox(
                                            height: SizeConfig.scaleHeight(10)),
                                        Row(
                                          children: [
                                            MyText(
                                                text: addressesGX
                                                    .addresses[index].info,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.Auth_COLOR),
                                            Spacer(),
                                            MyText(
                                                text: citiesGX
                                                    .cities[index].nameEn
                                                    .toString(),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Auth_COLOR),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width:
                                                    SizeConfig.scaleWidth(10)),
                                            ElevatedButtonC(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddAddressScreen(
                                                                editableAddress:
                                                                    addressesGX
                                                                            .addresses[
                                                                        index],
                                                              )));
                                                },
                                                text: 'Update',
                                                color: AppColors.COLOR),
                                            SizedBox(
                                                width:
                                                    SizeConfig.scaleWidth(15)),
                                            ElevatedButtonC(
                                                onPressed: () async {
                                                  await addressesGX
                                                      .deleteAddress(addressesGX
                                                          .addresses[index].id);
                                                },
                                                text: 'Delete',
                                                color: AppColors.GColor),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('Error'));
        }
      },
    );
  }
}
/*ListTile(
                                      leading: Text(
                                          addressesGX.addresses[index].name),
                                      title: Text(
                                          addressesGX.addresses[index].info),
                                      subtitle: Text(
                                          addressesGX.addresses[index]
                                              .contactNumber),
//                                  trailing:Text( addressesGX.addresses[index].city!.nameEn),


//                                  cityName: addressesGX.addresses[index].city!.nameEn,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddAddressScreen(
                                                      editableAddress: addressesGX
                                                          .addresses[index],)));
                                        //print(addressesGX.addresses[index].city!.nameEn);
                                      },
                                      onLongPress: () async {
                                        Get.defaultDialog(
                                          title: 'Remove Product',
                                          content: MyText(
                                            text: 'Remove this product from your favorites ?',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.Auth_COLOR,),
                                          textCancel: 'Cancel',
                                          textConfirm: 'Delete',
                                          cancelTextColor: Colors.black,
                                          confirmTextColor: Colors.white,
                                          onConfirm: () async {
                                            Get.back();
//                                        await addressesGX.deleteAddress(addressesGX.addresses[index].id);
                                          },
                                          titleStyle: TextStyle(
                                            fontFamily: 'Mont',),
                                          buttonColor: Colors.black,
                                        );
                                      },

                                    );*/
