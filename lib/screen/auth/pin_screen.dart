import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/Budget_text.dart';
import 'package:smart_store/widget/app_elevated_button.dart';
import 'package:smart_store/widget/pin_Button.dart';
import 'package:smart_store/widget/pin_textField.dart';

class PinScreen extends StatefulWidget {
  final bool isToModify;
  PinScreen({this.isToModify = false});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  late bool modify;
  String pinCode = '';
  List<String> buttonsText = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  List<Color> textFilesColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  int selectedTextFiled = 0;
  late String pinText;
  late final List<TextEditingController> textFieldControllers;

  @override
  void initState() {
    super.initState();
    modify = widget.isToModify;
    textFieldControllers = [

      TextEditingController(text: ''),
      TextEditingController(text: ''),
      TextEditingController(text: ''),
      TextEditingController(text: ''),
    ];
  }

  @override
  void dispose() {
    textFieldControllers[0].dispose();
    textFieldControllers[1].dispose();
    textFieldControllers[2].dispose();
    textFieldControllers[3].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pinText = modify
        ? AppLocalizations.of(context)?.pin_old_text ?? ''
        : AppLocalizations.of(context)?.pin_new_text ?? '';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.AppMainColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.scaleWidth(10),
            vertical: SizeConfig.scaleHeight(0)),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            BudgetText(
              AppLocalizations.of(context)?.face ?? '',
              fontSize: SizeConfig.scaleTextFont(20),
              color: AppColors.TextMainColor,
              fontWeight: FontWeight.bold,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(40)),
              height: SizeConfig.scaleHeight(60),
              child: Text(
                pinText,
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: SizeConfig.scaleTextFont(16),
                //   color: AppColors.TextGreyColor,
                //   fontFamily:
                //       // Provider.of<LanguageChangeNotifier>(context).language == 'en'
                //       //     ? 'SFUIDisplay'
                //       //     : 'Cairo',
                // ),
              ),
            ),
            // Row of textFields to enter the pin code
            ////////////////////// Text Fields Row /////////////////////////////
            SizedBox(
              width: SizeConfig.scaleWidth(250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PinButton(
                      text:'X',
                      onPressed: () {
                        clear();
                      },
                      widthMultiply: 0.7),
                  PinTextField(textFieldControllers[0], textFilesColors[0]),
                  PinTextField(textFieldControllers[1], textFilesColors[1]),
                  PinTextField(textFieldControllers[2], textFilesColors[2]),
                  PinTextField(textFieldControllers[3], textFilesColors[3]),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(60)),
            SizedBox(
              width: SizeConfig.scaleWidth(270),
              height: SizeConfig.scaleHeight(370),
              child: Column(
                children: [
                  ////////////////////// First Buttons Row /////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PinButton(
                          text: buttonsText[0],
                          onPressed: () {
                            enterPin(buttonsText[0]);
                          },
                          widthMultiply: 1),
                      PinButton(
                          text: buttonsText[1],
                          onPressed: () {
                            enterPin(buttonsText[1]);
                          },
                          widthMultiply: 1),
                      PinButton(
                          text: buttonsText[2],
                          onPressed: () {
                            enterPin(buttonsText[2]);
                          },
                          widthMultiply: 1),
                    ],
                  ),
                  ////////////////////// Second Buttons Row /////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PinButton(
                          text: buttonsText[3],
                          onPressed: () {
                            enterPin(buttonsText[3]);
                          },
                          widthMultiply: 1),
                      PinButton(
                          text: buttonsText[4],
                          onPressed: () {
                            enterPin(buttonsText[4]);
                          },
                          widthMultiply: 1),
                      PinButton(
                          text: buttonsText[5],
                          onPressed: () {
                            enterPin(buttonsText[5]);
                          },
                          widthMultiply: 1),
                    ],
                  ),
                  ////////////////////// Third Buttons Row /////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PinButton(
                          text: buttonsText[6],
                          onPressed: () {
                            enterPin(buttonsText[6]);
                          },
                          widthMultiply: 1),
                      PinButton(
                          text: buttonsText[7],
                          onPressed: () {
                            enterPin(buttonsText[7]);
                          },
                          widthMultiply: 1),
                      PinButton(
                          text: buttonsText[8],
                          onPressed: () {
                            enterPin(buttonsText[8]);
                          },
                          widthMultiply: 1),
                    ],
                  ),
                  ////////////////////// Forth Buttons Row /////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinButton(
                          text: buttonsText[9],
                          onPressed: () {
                            enterPin(buttonsText[9]);
                          },
                          widthMultiply: 1),

                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.scaleHeight(20)),
            AppElevatedButton(
              text: AppLocalizations.of(context)?.login ?? '',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/ResetPasswordScreen');

                //TODO: Save Bin Code To Shared preferences, if the screen to modify must enter old bin
                // if (selectedTextFiled == 4) {
                //   if (modify) {
                //     saveWithComparing(context);
                //   } else {
                //     saveWithoutComparing(context);
                //   }
                // } else {
                //   // AppSettings.showMessage(
                //   //   context,
                //   //   AppLocalizations.of(context)?.pin_error_text ?? '',
                //   //   error: true,
                //   // );
                // }
              },
            ),
          ],
        ),
      ),
    );
  }

  void enterPin(String num) {
    setState(() {
      if (selectedTextFiled < 4) {
        textFieldControllers[selectedTextFiled].text = num;
        textFilesColors[selectedTextFiled] = AppColors.AppMainColor;
        pinCode += num;
        selectedTextFiled += 1;
      }
    });
  }

  void clear() {
    setState(() {
      for (int i = 0; i < 4; ++i) {
        textFieldControllers[i].text = '';
        textFilesColors[i] = Colors.white;
      }
      pinCode = '';
      selectedTextFiled = 0;
    });
  }

  saveWithoutComparing(BuildContext context) {
    // Provider.of<PinProvider>(context, listen: false).pinCode = pinCode;

    Navigator.pop(context);
  }

  saveWithComparing(BuildContext context) {
    // if (comparePinCode(context)) {
    //   if (pinCode != '') {
    //     // Provider.of<PinProvider>(context, listen: false).pinCode = pinCode;
    //     Navigator.pop(context);
    //   }
    // }
  }

  // bool comparePinCode(BuildContext context) {
  //   String oldPinCode =
  //       // Provider.of<UserDBProvider>(context, listen: false).user.pinCode;
  //   // if (pinCode != oldPinCode) {
  //   //   // AppSettings.showMessage(
  //   //   //     context, AppLocalizations.of(context)?.pin_wrong_text ?? '',
  //   //   //     error: true);
  //   //   clear();
  //   //
  //   //   return false;
  //   // } else {
  //   //   // AppSettings.showMessage(
  //   //   //     context, AppLocalizations.of(context)?.pin_correct_text ?? '');
  //   //   clear();
  //   //   setState(() {
  //   //     modify = false;
  //   //   });
  //   //
  //   //   return true;
  //   // }
  // }
}
