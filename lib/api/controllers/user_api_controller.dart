import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model/user.dart';
import 'package:smart_store/stroage/user_share_pref_controller.dart';
import 'package:smart_store/utils/helpers.dart';

class UserApiController {
  Future<User?> login(BuildContext context, String mobile, String password) async {
    print('LOGIN URL: ${ApiSettings.USERS_LOGIN}');
    var url = Uri.parse(ApiSettings.USERS_LOGIN);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200) {
      var userJsonObject = jsonDecode(response.body)['data'];
      return User.fromJson(userJsonObject);
    } else {
      var jsonResponse = jsonDecode(response.body);
      Helpers.showSnackBar(
        context: context,
        message: jsonResponse['message'],
        error: true,
      );
    }
    return null;
  }

  Future<bool> logout() async {
    Uri url = Uri.parse(ApiSettings.USERS_LOGOUT);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserSharedPrefController().getToken()
    });
    if (response.statusCode == 200) {
      UserSharedPrefController().logout();
      return true;
    }
    return false;
  }
  Future<bool> forgetPassword( context, {required String mobile}) async {
    var url = Uri.parse(ApiSettings.USERS_FORGET_PASSWORD);
    var response = await http.post(url, body: {'mobile': mobile});
    if(response.statusCode == 200){
      Helpers.showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      print('Code: ${jsonDecode(response.body)['code']}');
      return true;
    }
    Helpers.showSnackBar(context: context, message: jsonDecode(response.body)['message'],error: true);
    return false;
  }

  Future<bool> resetPassword( context,
      {required String password, required String mobile, required String code}) async{
    var url = Uri.parse(ApiSettings.USERS_RESET_PASSWORD);
    var response = await http.post(url,body: {
      'mobile':mobile,
      'password': password,
      'password_confirmation':password,
      'code':code
    });
    if(response.statusCode == 200){
      Helpers.showSnackBar(context: context, message: jsonDecode(response.body)['message']);
      return true;
    }
    Helpers.showSnackBar(context: context, message: jsonDecode(response.body)['message'],error: true);
    return false;
  }

  // Future<List<User>> indexUsers() async{
  //   var url = Uri.parse(ApiSettings.USERS_REGISTER_PASSWORD);
  //   var response = await http.get(url);
  //   if(response.statusCode != 400 || response.statusCode != 500){
  //     User<City> user = User<City>.fromJson(jsonDecode(response.body));
  //     return ;
  //   }
  //   print("API: WE ARE HERE ${response.body}");
  //   return [];
  // }
}
