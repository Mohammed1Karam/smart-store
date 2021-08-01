import 'dart:convert';

import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/model/category/base_categories.dart';
import 'package:smart_store/model/category/categories.dart';
import 'package:http/http.dart' as http;

class CategoryApiController{
  // Future<List<Category>> indexCategory() async{
  //   var url = Uri.parse(ApiSettings.CATEGORIES_GET);
  //   var response = await http.get(url);
  //   if(response.statusCode != 400 || response.statusCode != 500){
  //     var baseCategories = BaseCategories.fromJson(jsonDecode(response.body));
  //     return baseCategories.categories;
  //   }
  //   print("API: WE ARE HERE ${response.body}");
  //   return [];
  // }
  //     Future<List<Category>> indexCategory() async{
  //       var url = Uri.parse(ApiSettings.CATEGORIES_GET);
  //       var response = await http.get(url);
  //       if(response.statusCode != 400 || response.statusCode != 500){
  //         BaseCategories baseResponse = BaseCategories.fromJson(jsonDecode(response.body));
  //         print('Message: ${baseResponse.message}');
  //         return baseResponse.categories;
  //       }
  //       return [];
  //     }

  // Future<List<Category>> indexCategory() async{
  //   var url = Uri.parse(ApiSettings.CATEGORIES_GET);
  //   var response = await http.get(url);
  //   if(response.statusCode != 400 || response.statusCode != 500){
  //     BaseCategories<Category> bC = BaseCategories.fromJson(jsonDecode(response.body));
  //     return bC.categories;
  //   }
  //   print("API: Category ${response.body}");
  //   return [];
  // }
  Future<List<Category>> indexCategory() async{
    var url = Uri.parse(ApiSettings.CATEGORIES_GET);
    var response = await http.get(url);
    if(response.statusCode != 400 || response.statusCode != 500){
      BaseCategories<Category> baseResponse = BaseCategories.fromJson(jsonDecode(response.body));
      return baseResponse.categories;
    }
    print("API: WE ARE HERE ${response.body}");
    return [];
  }

  // Future<List<Category>> main() async {
  //   // This example uses the Google Books API to search for books about http.
  //   // https://developers.google.com/books/docs/overview
  //   var url = Uri.parse(ApiSettings.CATEGORIES_GET);
  //   // var response = await http.get(Uri.parse(ApiSettings.CATEGORIES_GET));
  //
  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse =
  //     convert.jsonDecode(response.body) as Map<String, dynamic>;
  //     var itemCount = jsonResponse['totalItems'];
  //     print('Number of books about http: $itemCount.');
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }
}