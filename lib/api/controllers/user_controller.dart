import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model/user.dart';
import 'package:smart_store/utils/helpers.dart';


class UserController extends GetxController{
  Rxn<User> user = Rxn<User>();
  Future<bool> register({
    required String username,
    required String mobile,
    required String password,
    required String gender,
    required int cityId
  })async{
    final url=Uri.parse(ApiSettings.USERS_REGISTER_PASSWORD);
    final response = await http.post(url,body:{
      'name':username,
      'mobile':mobile,
      'password':password,
      'gender':gender,
      'STORE_API_KEY':'1b4d573d-ee99-418b-9a2e-fd96b3ad5329',
      'city_id':cityId.toString(),
    });
    final decoded = jsonDecode(response.body);
    if(response.statusCode > 201){
      Get.snackbar('Error',decoded['message']);
      return false;
    }else{
      Get.snackbar('Success',decoded['message']);
      print(decoded['code']);
      return true;
    }
  }

  Future<bool> activate({required String mobile,required String code})async{
    final url = Uri.parse(ApiSettings.USERS_activate);
    final response = await http.post(url,body:{'mobile':mobile,'code':code});
    final decoded = jsonDecode(response.body);
    if(response.statusCode==200){
      Get.snackbar('Success', decoded['message'],duration: Duration(milliseconds: 1500));
      await Future.delayed(Duration(seconds: 2),(){});
      return true;
    }else{
      Get.snackbar('Error', decoded['message']);
      return false;
    }
  }

  Future<bool> login({required String mobile,required String password})async{
    final url = Uri.parse(ApiSettings.USERS_LOGIN);
    final response = await http.post(url,body:{'mobile':mobile,'password':password});
    final decoded = json.decode(response.body);
    if(response.statusCode==200){
      Get.snackbar('Login Successfully', decoded['message'],duration: Duration(milliseconds: 1500));
      await Future.delayed(Duration(seconds: 2),()async{
        user.value = User.fromJson(decoded['data']);
        await GetStorage().write('user', jsonEncode(user.value));
        await GetStorage().write('loggedIn',true);
      });
      return true;
    }else{
      Get.snackbar('Login Error', decoded['message']);
      return false;
    }
  }

  Future<bool> logout()async{
    final  url = Uri.parse(ApiSettings.USERS_LOGOUT);
    final response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:user.value!.token});
    print(response.statusCode);
    if(response.statusCode==200){
      await GetStorage().remove('loggedIn');
      await GetStorage().remove('user');
      return true;
    }else{
      return false;
    }
  }
//
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

}
