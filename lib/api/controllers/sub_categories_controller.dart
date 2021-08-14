 import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
 import 'package:http/http.dart' as http;
import 'package:smart_store/model/category/sub_categories.dart';

 class SubCategoriesController extends GetxController{
   final token = Get.find<UserController>().user.value!.token;


   RxList<SubCategories> subCategories = <SubCategories>[].obs;
   //var categories = <Category>[].obs;
//List<Category> categories = <Category>[].obs;
   var m=0.obs;
   Future<bool> subCategoriesIndex(int id)async{
     final url = Uri.parse(ApiSettings.SUB_CATEGORIES_GET+id.toString());
     final response = await http.get(url,headers:{
       HttpHeaders.authorizationHeader: token,
       'X-Requested-With':'XMLHttpRequest'
     });
//     print(token);
//     print(' ddddddddddddd ${response.statusCode}');
//     print(response.statusCode);

     final decoded = jsonDecode ( response.body );
     if (response.statusCode == 200) {
       final mappedSubCategories = decoded['list'] as List;
       subCategories.value =
           mappedSubCategories.map ( (e) => SubCategories.fromJson ( e ) ).toList ();
       subCategories.refresh();
       return true;
     } else {
       return false;
     }
   }
 }

