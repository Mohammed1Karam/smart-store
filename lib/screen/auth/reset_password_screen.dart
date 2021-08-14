import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/CitiesController.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/helpers.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/header_text.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/widget/text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String mobile;

  ResetPasswordScreen({required this.mobile});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late FocusNode _firstCodeFocusNode;
  late FocusNode _secondCodeFocusNode;
  late FocusNode _thirdCodeFocusNode;
  late FocusNode _fourthCodeFocusNode;

  late TextEditingController _firstCodeTextEditingController;
  late TextEditingController _secondCodeTextEditingController;
  late TextEditingController _thirdCodeTextEditingController;
  late TextEditingController _fourthCodeTextEditingController;

  late TextEditingController _passwordTextEditingController;
  late TextEditingController _passwordConfirmationTextEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstCodeFocusNode = FocusNode();
    _secondCodeFocusNode = FocusNode();
    _thirdCodeFocusNode = FocusNode();
    _fourthCodeFocusNode = FocusNode();

    _passwordTextEditingController = TextEditingController();
    _passwordConfirmationTextEditingController = TextEditingController();

    _firstCodeTextEditingController = TextEditingController();
    _secondCodeTextEditingController = TextEditingController();
    _thirdCodeTextEditingController = TextEditingController();
    _fourthCodeTextEditingController = TextEditingController();


  }



  @override
  void dispose() {
    // TODO: implement dispose
    _firstCodeFocusNode.dispose();
    _secondCodeFocusNode.dispose();
    _thirdCodeFocusNode.dispose();
    _fourthCodeFocusNode.dispose();

    _passwordTextEditingController.dispose();
    _passwordConfirmationTextEditingController.dispose();

    _firstCodeTextEditingController.dispose();
    _secondCodeTextEditingController.dispose();
    _thirdCodeTextEditingController.dispose();
    _fourthCodeTextEditingController.dispose();
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
              text: 'RESET PASSWORD',
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
            MyText(
                text: 'Reset your password...',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.Auth_COLOR),
            MyText(
                text: 'Enter your email, code & new password',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.Auth_COLOR),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _firstCodeTextEditingController,
                      focusNode: _firstCodeFocusNode,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (String text) {
                        if (text.length == 1) {
                          _secondCodeFocusNode.requestFocus();
                        }
                      },
                      style:
                          TextStyle(color: AppColors.Auth_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        counterText: '',
                        fillColor: AppColors.White_COLOR,
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.Auth_COLOR,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppColors.COLOR, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _secondCodeTextEditingController,
                      focusNode: _secondCodeFocusNode,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (String text) {
                        if (text.length == 1) {
                          _thirdCodeFocusNode.requestFocus();
                        }
                      },
                      style:
                          TextStyle(color: AppColors.Auth_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.Auth_COLOR,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.COLOR,
                            width: 2,
                          ),
                        ),
                        fillColor: AppColors.White_COLOR,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _thirdCodeTextEditingController,
                      focusNode: _thirdCodeFocusNode,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (String text) {
                        if (text.length == 1) {
                          _fourthCodeFocusNode.requestFocus();
                        }
                      },
                      style:
                          TextStyle(color: AppColors.Auth_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.Auth_COLOR,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.COLOR,
                            width: 2,
                          ),
                        ),
                        fillColor: AppColors.White_COLOR,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _fourthCodeTextEditingController,
                      focusNode: _fourthCodeFocusNode,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: AppColors.Auth_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.Auth_COLOR,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.COLOR,
                            width: 2,
                          ),
                        ),
                        fillColor: AppColors.White_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextFieldA(
              hintText: 'Password',
              textInputType: TextInputType.number,
              controller: _passwordTextEditingController,
            ),
            SizedBox(height: 10),
            TextFieldA(
              hintText: 'Confrim password',
              textInputType: TextInputType.number,
              controller: _passwordConfirmationTextEditingController,
            ),
            SizedBox(height: 20),
            ElevatedButtonA(
                onPressed: () async {
                  await performPasswordReset();
                },
                color: AppColors.COLOR,
                icon: Icons.save_alt_sharp,
                text: 'RESET'),
            SizedBox(height: 20),
            Image.asset('images/happy.png'),
          ],
        ),
      ),
    );
  }

  Future performPasswordReset() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (_passwordTextEditingController.text.isNotEmpty &&
        _passwordConfirmationTextEditingController.text.isNotEmpty &&
        checkCode()) {
      return checkPasswordConfirmation();
    }

    Helpers.showSnackBar(
      context: context,
      message: 'Check required data',
      error: true,
    );
    return false;
  }

  bool checkPasswordConfirmation() {
    if (_passwordTextEditingController.text ==
        _passwordConfirmationTextEditingController.text) {
      return true;
    }
    Helpers.showSnackBar(
        context: context, message: 'Password confirmation error', error: true);
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextEditingController.text.isNotEmpty &&
        _secondCodeTextEditingController.text.isNotEmpty &&
        _thirdCodeTextEditingController.text.isNotEmpty &&
        _fourthCodeTextEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future resetPassword() async {
    bool status = await UserController().resetPassword(
      context,
      password: _passwordTextEditingController.text,
      mobile: widget.mobile,
      code: getCode(),
    );
    if (status) {
      Navigator.pop(context);
    }
  }

  String getCode() {
    return _firstCodeTextEditingController.text +
        _secondCodeTextEditingController.text +
        _thirdCodeTextEditingController.text +
        _fourthCodeTextEditingController.text;
  }
}
