import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../model/AddressesController.dart';
import 'package:smart_store/api/controllers/CitiesController.dart';
import 'package:smart_store/model/address.dart';
import 'package:smart_store/model/city.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/helpers.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:smart_store/widget/text_field.dart';

// ignore: must_be_immutable
class AddAddressScreen extends StatefulWidget {
  Address? editableAddress;

  AddAddressScreen({this.editableAddress});

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late Future<bool> indexCities;

  final citiesGX = Get.find<CityController>();
//  final citiesGx = Get.put(CityController());

  final addressesGX = Get.find<AddressesController>();
  late City dropdownValue;
  late TextEditingController nameController;
  late TextEditingController infoController;
  late TextEditingController contactNumberController;
  late TextEditingController _cityTextEditingController;

  Color nameTextColor = Colors.black;
  Color nameHintTextColor = AppColors.GColor;
  Color nameCursorColor = Colors.black;
  Color nameBorderColor = AppColors.TextGreyColor;

  Color infoTextColor = Colors.black;
  Color infoHintTextColor = AppColors.COLOR;
  Color infoCursorColor = Colors.black;
  Color infoBorderColor = AppColors.TextGreyColor;

  Color dropDownMenuColor = Colors.black;

  Color contactNumberTextColor = Colors.black;
  Color contactNumberHintTextColor = AppColors.COLOR;
  Color contactNumberCursorColor = Colors.black;
  Color contactNumberBorderColor = AppColors.TextGreyColor;

  bool nameStatus = false;
  bool infoStatus = false;
  bool contactNumberStatus = false;
  bool indicator = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    indexCities = citiesGX.citiesIndex();
    nameController = TextEditingController();
    infoController = TextEditingController();
    contactNumberController = TextEditingController();
    _cityTextEditingController = TextEditingController();

    if (widget.editableAddress != null) {
      nameController.text = widget.editableAddress!.name;
      infoController.text = widget.editableAddress!.info;
      contactNumberController.text =
          '0' + widget.editableAddress!.contactNumber;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    infoController.dispose();
    contactNumberController.dispose();
    _cityTextEditingController.dispose();
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
//        backgroundColor: Colors.white,
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
              text: 'Add Shipping Address',
              fText: 'Merienda',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.Auth_COLOR),
        ),
        body: FutureBuilder(
          future: indexCities,
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
              if (indicator) {
                if (widget.editableAddress != null) {
//                dropdownValue = citiesGX.cities[citiesGX.citiesIndex(widget.editableAddress!.cityId)!];
                } else {
                  dropdownValue = citiesGX.cities[0];
                }
                indicator = false;
              }
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.scaleHeight(10)),
                      MyText(
                          text: 'Add new Address',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.COLOR),
                      SizedBox(height: SizeConfig.scaleHeight(10)),
                      MyText(
                          text: 'Please enter information to add your address',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.Auth_COLOR),
                      SizedBox(height: SizeConfig.scaleHeight(10)),
                      MyText(
                          text: 'Name',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.COLOR),
                      TextFieldA(
                          hintText: 'Enter your address',
                          controller: nameController),
                      SizedBox(height: SizeConfig.scaleHeight(10)),

                      MyText(
                          text: 'Address Information',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.COLOR),
                      TextFieldA(
                          hintText: 'Enter Address Information',
                          controller: infoController),
                      SizedBox(height: SizeConfig.scaleHeight(10)),

                      MyText(
                          text: 'Contact Number',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.COLOR),
                      TextFieldA(
                          hintText: 'Enter your contact number',
                          controller: contactNumberController),
                      SizedBox(height: SizeConfig.scaleHeight(10)),

                      MyText(
                        text: 'City',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.COLOR,
                      ),
//                      TextFieldA(
//                        hintText: 'Enter your id city',
//                        textInputType: TextInputType.emailAddress,
//                        controller: _cityTextEditingController,
//                      ),

                    DropdownButton<City>(
                      elevation: 0,
                      isExpanded: true,
                      isDense: false,
//                          style: Helpers.myTextStyle,
                      dropdownColor: AppColors.White_COLOR,
                      value: dropdownValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: citiesGX.cities.map((element) {
                        return DropdownMenuItem<City>(
                          child: Text(element.nameEn),
                          value: element,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    ),
                      SizedBox(height: SizeConfig.scaleHeight(10)),
                      ElevatedButtonA(
                          icon: Icons.save,
                          color: AppColors.COLOR,
                          onPressed: () {
                            perform();
                            Navigator.pop(context);
                          },
                          text: widget.editableAddress != null
                              ? 'Update'
                              : 'Add Address')
//                        ElevatedButtonCustom(
//                          buttonTitle: widget.editableAddress!=null?'Update':'Add Address',
//                          borderSide: BorderSide.none,
//                          height: 50,
//                          width: double.infinity,
//                          color: Colors.black,
//                          textColor: Colors.white,
//                          onPressed: perform,
//                        )
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }

  bool checkName(String value) {
    if (value.length >= 5) {
      nameTextColor = Colors.black;
      nameHintTextColor = AppColors.COLOR;
      nameCursorColor = Colors.black;
      nameBorderColor = AppColors.Auth_COLOR;
      return true;
    } else {
      nameTextColor = Colors.red;
      nameHintTextColor = Colors.red;
      nameCursorColor = Colors.red;
      nameBorderColor = Colors.red;
      return false;
    }
  }

  bool checkInfo(String value) {
    if (value.length >= 5) {
      infoTextColor = Colors.black;
      infoHintTextColor = AppColors.COLOR;
      infoCursorColor = Colors.black;
      infoBorderColor = AppColors.Auth_COLOR;
      return true;
    } else {
      infoTextColor = Colors.red;
      infoHintTextColor = Colors.red;
      infoCursorColor = Colors.red;
      infoBorderColor = Colors.red;
      return false;
    }
  }

  bool checkContactNumberField(String value) {
    if (value.length == 10 && GetUtils.isPhoneNumber(value)) {
      contactNumberTextColor = Colors.black;
      contactNumberHintTextColor = AppColors.COLOR;
      contactNumberCursorColor = Colors.black;
      contactNumberBorderColor = AppColors.Auth_COLOR;
      return true;
    } else {
      contactNumberTextColor = Colors.red;
      contactNumberHintTextColor = Colors.red;
      contactNumberCursorColor = Colors.red;
      contactNumberBorderColor = Colors.red;
      return false;
    }
  }

  bool checkAll() {
    if (checkName(nameController.text) &&
        checkInfo(infoController.text) &&
        checkContactNumberField(contactNumberController.text)) {
      return true;
    } else {
      setState(() {
        if (nameController.text.isEmpty) {
          nameBorderColor = Colors.red;
          nameHintTextColor = Colors.red;
          nameCursorColor = Colors.red;
        }
        if (infoController.text.isEmpty) {
          infoBorderColor = Colors.red;
          infoHintTextColor = Colors.red;
          infoCursorColor = Colors.red;
        }
        if (contactNumberController.text.isEmpty) {
          contactNumberBorderColor = Colors.red;
          contactNumberHintTextColor = Colors.red;
          contactNumberCursorColor = Colors.red;
        }
      });
      Get.snackbar('Adding Failed', 'Please check required data',
          duration: Duration(milliseconds: 1500));
      return false;
    }
  }

  perform() async {
    if (checkAll()) {
      bool result;
      if (widget.editableAddress != null) {
        widget.editableAddress!.name = nameController.text;
        widget.editableAddress!.info = infoController.text;
        widget.editableAddress!.contactNumber =
            contactNumberController.text.substring(1, 10);
        widget.editableAddress!.cityId = dropdownValue.id;
        widget.editableAddress!. cityId= dropdownValue.id;

        result = await addressesGX.updateAddress(widget.editableAddress!);
      } else {
        result = await addressesGX.createAddress(
            name: nameController.text,
            info: infoController.text,
            cityId: dropdownValue.id,
            contactNumber: contactNumberController.text.substring(1, 10));
      }

      if(result){
        Navigator.pop(context);
      }
    }
  }
}
