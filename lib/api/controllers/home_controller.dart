 import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
 import 'package:smart_store/model/category/categories.dart';
 import 'package:http/http.dart' as http;
import 'package:smart_store/model/home/base_home.dart';
import 'package:smart_store/model/home/categories.dart';
import 'package:smart_store/model/home/latestProducts.dart';
import 'package:smart_store/model/home/slider.dart';
import 'package:smart_store/stroage/user_share_pref_controller.dart';

 class HomeController extends GetxController{
   final token = Get.find<UserController>().user.value!.token;

//   RxList<Product> products = <Product>[].obs;
   Rxn<Home> HomeOpj = Rxn<Home>();

   Future<bool> indexHome()async{
     final url = Uri.parse(ApiSettings.HOME);
     final response = await http.get(url,headers:{
       HttpHeaders.authorizationHeader:token,
       'X-Requested-With':'XMLHttpRequest'
     });
//     print(token);
//     print(response.statusCode);
//     print(response.statusCode);
     final decoded = jsonDecode(response.body);
     if(response.statusCode==200){
       final homeopj = decoded['data'];
       HomeOpj.value = Home.fromJson(homeopj);
       HomeOpj.refresh();
       return true;
     }else{
       HomeOpj.value = null;
       return false;
     }
   }
 }

