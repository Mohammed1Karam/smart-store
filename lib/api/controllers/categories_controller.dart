 import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
 import 'package:smart_store/model/category/categories.dart';
 import 'package:http/http.dart' as http;

 class CategoriesController extends GetxController{
   final token = Get.find<UserController>().user.value!.token;


   RxList<Category> categories = <Category>[].obs;
   //var categories = <Category>[].obs;
//List<Category> categories = <Category>[].obs;
   var m=0.obs;
   Future<bool> categoriesIndex()async{
     final url = Uri.parse(ApiSettings.CATEGORIES_GET);
     final response = await http.get(url,headers:{
       HttpHeaders.authorizationHeader: token,
       'X-Requested-With':'XMLHttpRequest'
     });
//     print(token);
//     print(response.statusCode);
//     print(response.statusCode);

     final decoded = jsonDecode ( response.body );
     if (response.statusCode == 200) {
       final mappedCategories = decoded['list'] as List;
       categories.value =
           mappedCategories.map ( (e) => Category.fromJson ( e ) ).toList ();
       categories.refresh();
       return true;
     } else {
       return false;
     }
   }
 }

