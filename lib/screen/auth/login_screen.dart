import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/api/controllers/user_api_controller.dart';
import 'package:smart_store/model/user.dart';
import 'package:smart_store/stroage/user_share_pref_controller.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/helpers.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/header_text.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:smart_store/widget/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;
  late TapGestureRecognizer _tapNewGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = navigateToForgetPassword;

    _tapNewGestureRecognizer = TapGestureRecognizer()
      ..onTap = tapNewGestureRecognizer;
  }

  void navigateToForgetPassword() => Navigator.pushNamed(context, '/ForgetPasswordScreen');

  void tapNewGestureRecognizer() => Navigator.pushNamed(context, '/SignUpScreen');

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
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
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(),
              SizedBox(height: SizeConfig.scaleHeight(34)),
              MyText(
                  text: AppLocalizations.of(context)?.text1 ?? '',
                  fontSize: SizeConfig.scaleTextFont(21),
                  fontWeight: FontWeight.w500,
                  color: AppColors.Auth_COLOR),
              SizedBox(height: SizeConfig.scaleHeight(5)),
              MyText(
                  text: AppLocalizations.of(context)?.text2 ?? '',
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontWeight: FontWeight.w500,
                  color: AppColors.Auth_COLOR),
              SizedBox(height: SizeConfig.scaleHeight(55)),
              MyText(
                  text: AppLocalizations.of(context)?.mobile ?? '',
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontWeight: FontWeight.w500,
                  color: AppColors.COLOR),
              TextFieldA(
                hintText: AppLocalizations.of(context)?.hintText1 ?? '',
                textInputType: TextInputType.number,
                controller: _mobileTextEditingController,
              ),
              MyText(
                  text: AppLocalizations.of(context)?.password ?? '',
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontWeight: FontWeight.w500,
                  color: AppColors.COLOR),
              TextFieldA(
                hintText: AppLocalizations.of(context)?.hintText2 ?? '',
                textInputType: TextInputType.number,
                controller: _passwordTextEditingController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    // textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppLocalizations.of(context)?.forget ?? '',
                      style: TextStyle(
                        color: AppColors.Auth_COLOR,
                        fontSize: SizeConfig.scaleTextFont(20),
                      ),
                      recognizer: _tapGestureRecognizer,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(40)),
              ElevatedButtonA(
                onPressed: () async{
                 await performLogin();
                },
                text: AppLocalizations.of(context)?.login ?? '',
                icon: Icons.login,
                color: AppColors.COLOR,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppLocalizations.of(context)?.span1 ?? '',
                      style: TextStyle(
                        color: AppColors.Auth_COLOR,
                        fontSize: SizeConfig.scaleTextFont(20),
                      ),
                      children: [
                        TextSpan(text: ' '),
                        TextSpan(
                          text: AppLocalizations.of(context)?.span2 ?? '',
                          style: TextStyle(
                            color: AppColors.COLOR,
                            fontSize: SizeConfig.scaleTextFont(20),
                          ),
                          recognizer: _tapNewGestureRecognizer,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(40)),
              ElevatedButtonA(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/MainScreen');
                    performLogin();
                  },
                  text: AppLocalizations.of(context)?.face ?? '',
                  icon: Icons.face,
                  color: AppColors.Fas_COLOR),

            ],
          ),
        ),
      ),
    );
  }
  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_mobileTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }

    Helpers.showSnackBar(
      context: context,
      message: 'Enter mobile & password',
      error: true,
    );
    return false;
  }

  Future login() async {
    //TODO: LOGIN
    User? user = await UserApiController().login(
      context,
      _mobileTextEditingController.text,
      _passwordTextEditingController.text,
    );
    //TODO: SUCCESS -> SHOW SNACK BAR
    if (user != null) {
      UserSharedPrefController().save(user);
      Helpers.showSnackBar(context: context, message: 'Logged in successfully');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/MainScreen');
      });
    }
  }

}
