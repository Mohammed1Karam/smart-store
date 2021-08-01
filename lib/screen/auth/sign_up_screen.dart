import 'package:flutter/material.dart';
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

  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _cityTextEditingController = TextEditingController();
    _genderTextEditingController = TextEditingController();
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
    'None',
    'Callisto',
    'Ganymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
    'Jungle Gym',
    'Ukulele',
    'Snowflakes',
  ];
  final List<String> _ringGanders = [
    'Male',
    'Female',
  ];
  String _ringTone = "None";
  String _ringGander = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(),
            SizedBox(height: SizeConfig.scaleHeight(25)),
            MyText(
                text: AppLocalizations.of(context)?.text1t ?? '',
                fontSize: SizeConfig.scaleTextFont(21),
                fontWeight: FontWeight.w500,
                color: AppColors.Auth_COLOR),
            SizedBox(height: SizeConfig.scaleHeight(5)),
            MyText(
                text: AppLocalizations.of(context)?.text2t ?? '',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                color: AppColors.Auth_COLOR),
            SizedBox(height: SizeConfig.scaleHeight(40)),
            TextFieldA(
              hintText: AppLocalizations.of(context)?.hintName ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _nameTextEditingController,
            ),
            TextFieldA(
              hintText: AppLocalizations.of(context)?.hintText1 ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _mobileTextEditingController,
            ),
            TextFieldA(
              hintText: AppLocalizations.of(context)?.hintText2 ?? '',
              textInputType: TextInputType.emailAddress,
              controller: _passwordTextEditingController,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.COLOR)),
              elevation: 2,
              child: ListTile(
                onTap: _openRingtoneDialog,
                title: Text(AppLocalizations.of(context)?.hintCity ?? ''),
                subtitle: Text(_ringTone),
                leading: Icon(Icons.location_city),
                trailing: Icon(Icons.arrow_forward_rounded),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.Auth_COLOR),
              ),
              elevation: 2,
              child: ListTile(
                onTap: _openRingtoneDialogGander,
                title: Text(AppLocalizations.of(context)?.hintCity ?? ''),
                subtitle: Text(_ringGander),
                leading: Icon(Icons.accessibility),
                trailing: Icon(Icons.arrow_forward_rounded),
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(30)),
            ElevatedButtonA(
              onPressed: () {},
              text: AppLocalizations.of(context)?.login ?? '',
              icon: Icons.login,
              color: AppColors.COLOR,
            ),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            ElevatedButtonA(
                onPressed: () {},
                text: AppLocalizations.of(context)?.face ?? '',
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
        builder: (context) => SingleChoiceConfirmationDialog<String>(
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
        builder: (context) => SingleChoiceConfirmationDialog<String>(
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
}
