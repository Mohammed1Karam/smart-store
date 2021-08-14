import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/CitiesController.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/screen/auth/pin_password.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/header_text.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/widget/text_field.dart';
import 'package:easy_dialogs/easy_dialogs.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  late TextEditingController _nameTextEditingController;
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _cityTextEditingController;
  late TextEditingController _genderTextEditingController;

  String _selectedGender = 'M';
  bool isSwitched = false;

  final userGX = Get.put(UserController());

//  final cities = Get.put(CityController());
//  late Future<bool> categoriesIndex;
//

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _cityTextEditingController = TextEditingController();
    _genderTextEditingController = TextEditingController();

//    print('0000000000');
//    categoriesIndex = _controller.citiesIndex();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _genderTextEditingController.dispose();

    super.dispose();
  }

  final List<String> _ringTones = [
//    'None',
//    'Callisto',
//    'Ganymede',
//    'Luna',
//    'Oberon',
//    'Phobos',
//    'Dione',
//    'Jungle Gym',
//    'Ukulele',
//    'Snowflakes',
  ];
  final List<String> _ringGanders = [
    'Male',
    'Female',
  ];
  String _ringTone = "Gaza";
  String _ringGander = "Male";

  @override
  Widget build(BuildContext context) {
//    for (int i = 0; i < _controller.cities.length; i++) {
//      _ringTones.insert(i, _controller.cities[i].nameEn);
//    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(),
            SizedBox(height: SizeConfig.scaleHeight(25)),
            MyText(
                text: AppLocalizations
                    .of(context)
                    ?.text1t ?? '',
                fontSize: SizeConfig.scaleTextFont(21),
                fontWeight: FontWeight.w500,
                color: AppColors.Auth_COLOR),
            SizedBox(height: SizeConfig.scaleHeight(5)),
            MyText(
                text: AppLocalizations
                    .of(context)
                    ?.text2t ?? '',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                color: AppColors.Auth_COLOR),
            SizedBox(height: SizeConfig.scaleHeight(40)),
            TextFieldA(
              hintText: AppLocalizations
                  .of(context)
                  ?.hintName ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _nameTextEditingController,
            ),
            TextFieldA(
              hintText: AppLocalizations
                  .of(context)
                  ?.hintText1 ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _mobileTextEditingController,
            ),
            TextFieldA(
              hintText: AppLocalizations
                  .of(context)
                  ?.hintText2 ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _passwordTextEditingController,
            ),
            TextFieldA(
              hintText: AppLocalizations
                  .of(context)
                  ?.hintCity ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _cityTextEditingController,
            ),

            ListTile(
              leading: Radio(
                value: 'M',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = 'M';
                  });
                },
              ),
              title: Text('Male'),
            ),
            ListTile(
              leading: Radio(
                value: 'F',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = 'F';
                  });
                },
              ),
              title: Text('Female'),
            ),
            SizedBox(height: SizeConfig.scaleHeight(30)),
            ElevatedButtonA(
              onPressed: () {
                register();
              },
              text: AppLocalizations
                  .of(context)
                  ?.login ?? '',
              icon: Icons.login,
              color: AppColors.COLOR,
            ),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            ElevatedButtonA(
                onPressed: () {},
                text: AppLocalizations
                    .of(context)
                    ?.face ?? '',
                icon: Icons.face,
                color: AppColors.Fas_COLOR),
          ],
        ),
      ),
    );
  }

  _openRingtoneDialog() {
    showDialog(
        context: context,
        builder: (context) =>
            SingleChoiceConfirmationDialog<String>(
                title: Text('Phone ringtone'),
                initialValue: _ringTone,
                items: _ringTones,
                onSelected: _onSelected,
                onSubmitted: _onSubmitted));
  }

  void _onSelected(String value) {
    print('Selected $value');
    setState(() {
      _ringTone = value;
    });
  }

  void _onSubmitted(String value) {
    print('Submitted $value');
    setState(() {
      _ringTone = value;
    });
  }

  //////Gander
  _openRingtoneDialogGander() {
    showDialog(
        context: context,
        builder: (context) =>
            SingleChoiceConfirmationDialog<String>(
                title: Text('Phone ringtone'),
                initialValue: _ringGander,
                items: _ringGanders,
                onSelected: _onSelectedGander,
                onSubmitted: _onSubmittedGander));
  }

  void _onSelectedGander(String value) {
    print('Selected $value');
    setState(() {
      _ringTone = value;
    });
  }

  void _onSubmittedGander(String value) {
    print('Submitted $value');
    setState(() {
      _ringTone = value;
    });
  }

  Future register() async {
    bool status = await userGX.register(
        username: _nameTextEditingController.text,
        mobile: _mobileTextEditingController.text,
        password: _passwordTextEditingController.text,
        gender: _selectedGender,
        cityId: [ _cityTextEditingController.text].length,
    );
//        cityId: cities.cities.value[1].id);
//      context,
//      name: _.text,
//      mobile: _mobileTextEditingController.text,
//      password: _passwordTextEditingController.text,
//      gender: _selectedGender,
//      STORE_API_KEY: '58552860-cae5-4f85-854f-3ba5189256f6',
//      city_id: _cityTextEditingController.text);
//    resetPassword(
//      context,
//      password: _passwordTextEditingController.text,
//      email: widget.email,
//      code: getCode(),
//    );
    if (status) {
      print('00000');
//       Navigator.pushNamed(context, '/PinPassword');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PinPasswordScreen(mobile: _mobileTextEditingController.text)
    ));
      print('11111');
    }
  }
}
//late TextEditingController _nameTextEditingController;
//late TextEditingController _mobileTextEditingController;
//late TextEditingController _passwordTextEditingController;
//late TextEditingController _cityTextEditingController;
//late TextEditingController _genderTextEditingController;



