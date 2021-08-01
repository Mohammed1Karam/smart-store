import 'package:flutter/material.dart';
import 'package:smart_store/api/controllers/user_api_controller.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/helpers.dart';
import 'package:smart_store/widget/list_tile_setting.dart';
import 'package:smart_store/widget/my_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
        backgroundColor: Colors.white,
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
              text: 'Settings',
              fText: 'Merienda',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.Auth_COLOR),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListTileSetting(
                onTap: () {
                },
                icon: Icons.language,
                text: 'language',
                widget: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xff0D0E56),
                ),
                color: AppColors.COLOR,
              ),
              SizedBox(height: 10),
              ListTileSetting(
                icon: Icons.lock_open,
                text: 'Change password',
                widget: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xff0D0E56),
                ),
                color: AppColors.COLOR,
                onTap: () {
                  // showAlertDialog(context);
                },
              ),
              SizedBox(height: 10),
              ListTileSetting(
                icon: Icons.info,
                text: 'Addresses',
                widget: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xff0D0E56),
                ),
                color: AppColors.COLOR,
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              SizedBox(height: 10),
              ListTileSetting(
                icon: Icons.info,
                text: 'About',
                widget: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xff0D0E56),
                ),
                color: AppColors.COLOR,
                onTap: () {
                  Navigator.pushNamed(context, '/AboutScreen');
                },
              ),
              SizedBox(height: 10),
              ListTileSetting(
                icon: Icons.logout,
                text: 'logout',
                widget: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xff0D0E56),
                ),
                onTap: ()async{
                  await logout();
                },
                color: AppColors.COLOR,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future logout() async {
    //TODO: PERFORM LOGOUT API REQUEST
    bool loggedOut = await UserApiController().logout();
    if (loggedOut) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/LoginScreen', (route) => false);
    } else {
      Helpers.showSnackBar(
          context: context, message: 'Logout failed', error: true);
    }
  }

  // showAlertDialog(BuildContext context) {
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("Send"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //       Future.delayed(Duration(seconds: 3), () {
  //         Navigator.pushNamed(context, '/ChangePasswordScreen');
  //       });
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Enter the password"),
  //     content: TextFieldA(
  //       hintText: AppLocalizations.of(context)?.hintText1 ?? '',
  //       textInputType: TextInputType.number,
  //       controller: _passwordTextEditingController,
  //     ),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
