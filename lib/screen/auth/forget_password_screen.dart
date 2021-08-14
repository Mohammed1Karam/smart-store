import 'package:flutter/material.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/screen/auth/pin_screen.dart';
import 'package:smart_store/screen/auth/reset_password_screen.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/helpers.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:smart_store/widget/text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController _mobileTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
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
              text: 'FORGET PASSWORD',
              fText: 'Merienda',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.Auth_COLOR),
          actions: [
            Card(
              elevation: 5,
              color: AppColors.COLOR,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: AppColors.Auth_COLOR, width: 1.5),
              ),

            )
          ],
        ),
      
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            MyText(text: 'Forget password?', fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.Auth_COLOR),
            MyText(text: 'Enter your mobile to receive reset code', fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.Auth_COLOR),

            Text(
              'Enter your email to receive reset code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            TextFieldA(
              hintText: 'mobile',
              controller: _mobileTextEditingController,
              textInputType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButtonA(
                onPressed: () async {
                  await performForgetPassword();
                },
                color: AppColors.COLOR,
                icon: Icons.send_and_archive,
                text: 'Send'),
            SizedBox(height: 30),

            Image.asset('images/happy.png'),

          ],
        ),
      ),
    );
  }

  Future performForgetPassword() async {
    if (check()) {
      await forgetPassword();
    }
  }

  bool check() {
    if (_mobileTextEditingController.text.isNotEmpty) {
      return true;
    }
    Helpers.showSnackBar(
        context: context, message: 'Enter email address', error: true);
    return false;
  }

  Future forgetPassword() async {
    //
    bool status = await UserController().forgetPassword(context, mobile: _mobileTextEditingController.text);
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ResetPasswordScreen(mobile: _mobileTextEditingController.text)),
      );
    }
  }
}
