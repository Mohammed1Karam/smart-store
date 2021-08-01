import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonA.dart';
import 'package:smart_store/widget/header_text.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/widget/text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController newPasswordConfirmationTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPasswordTextEditingController = TextEditingController();
    newPasswordConfirmationTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordTextEditingController.dispose();
    newPasswordConfirmationTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.W200_COLOR,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: ListView(
          children: [
            HeaderText(),
            SizedBox(height: SizeConfig.scaleHeight(34)),
            MyText(
                text: AppLocalizations.of(context)?.reset_text1 ?? '',
                fontSize: SizeConfig.scaleTextFont(21),
                fontWeight: FontWeight.w500,
                color: AppColors.Auth_COLOR),
            SizedBox(height: SizeConfig.scaleHeight(5)),
            MyText(
                text: AppLocalizations.of(context)?.reset_text2 ?? '',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                color: AppColors.Auth_COLOR),
            SizedBox(height: SizeConfig.scaleHeight(55)),
            MyText(
                text: AppLocalizations.of(context)?.reset_new_text1 ?? '',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                color: AppColors.COLOR),
            TextFieldA(
              hintText: AppLocalizations.of(context)?.reset_new_text1 ?? '',
              textInputType: TextInputType.number,
              controller: _newPasswordTextEditingController,
            ),
            MyText(
                text: AppLocalizations.of(context)?.reset_new_text2 ?? '',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                color: AppColors.COLOR),
            TextFieldA(
              hintText: AppLocalizations.of(context)?.reset_new_text2 ?? '',
              textInputType: TextInputType.visiblePassword,
              controller: newPasswordConfirmationTextEditingController,
            ),
            SizedBox(height: SizeConfig.scaleHeight(40)),
            ElevatedButtonA(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/LoginScreen');

              },
              text: AppLocalizations.of(context)?.reset_Botton ?? '',
              icon: Icons.confirmation_number,
              color: AppColors.COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
