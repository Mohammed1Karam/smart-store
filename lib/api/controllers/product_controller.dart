import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/model/category/categories.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/model/product/product.dart';

class ProductController extends GetxController {
  final token = Get.find<UserController>().user.value!.token;

  RxList<Product> products = <Product>[].obs;
  Rxn<Product> detailedProduct = Rxn<Product>();

  //var categories = <Category>[].obs;
//List<Category> categories = <Category>[].obs;
  var m = 0.obs;

  Future<bool> productIndex(int id) async {
//    print(token);

    final url = Uri.parse(ApiSettings.PRODUCT_GET+id.toString());
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: token,
      'X-Requested-With': 'XMLHttpRequest'
    });
    print(token);
    print(response.statusCode);
    print(response.statusCode);
    final decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final mappedProducts = decoded['list'] as List;
      products.value = mappedProducts.map((e) => Product.fromJson(e)).toList();
      products.refresh();
      return true;
    } else {
      return false;
    }
  }
}
//Future<bool> indexFavoriteProducts()async{
//  final url = Uri.parse(ApiSettings.Favorite_products_Get);
//  final response = await http.get(url,
//      headers:{
//        HttpHeaders.authorizationHeader: token,
//        'X-Requested-With':'XMLHttpRequest',
//        'Accept':'application/json'
//      });
//  final decoded = jsonDecode(response.body);
//  if(response.statusCode==200){
//    final mappedProducts = decoded['list'] as List;
//    final x = mappedProducts.map((e) => Product.fromJson(e)).toList();
//    favorateProduct.value = x;
//    return true;
//  }else{
//    favoriteProducts.clear();
//    return false;
//  }
//}
//
//Future<bool> toggleFavoriteState(int id)async{
//  final url = Uri.parse(ApiSettings.Favorite_products_Get);
//  final response = await http.post(url,body:{'product_id':id.toString()},
//      headers:{
//        HttpHeaders.authorizationHeader:token,
//        'X-Requested-With':'XMLHttpRequest'});
//  final decoded = jsonDecode(response.body);
//  if(response.statusCode==200){
//    Get.snackbar('Success', decoded['message'],duration: Duration(seconds:1));
//
//    ///update on detailedProduct
//    if(detailedProduct.value!=null){
//      if(detailedProduct.value!.id==id){
//        final temp = detailedProduct.value;
//        temp!.isFavorite = !temp.isFavorite;
//        detailedProduct.value=null;
//        detailedProduct.value=temp;
//      }
//    }
//    ///update on subCategoryProducts list
//    if(subCategoryProducts.isNotEmpty){
//      final index= subCategoryProducts.indexWhere((element) => element.id==id);
//      if(index>=0){
//        final temp = subCategoryProducts[index];
//        temp.isFavorite=!temp.isFavorite;
//        subCategoryProducts[index]=temp;
//      }
//    }
//    ///update on home screen
//    if(homeGX.latestProducts.isNotEmpty){
//      final indexLp= homeGX.latestProducts.indexWhere((element) => element.id==id);
//      if(indexLp>=0){
//        final temp = homeGX.latestProducts[indexLp];
//        temp.isFavorite=!temp.isFavorite;
//        homeGX.latestProducts[indexLp]=temp;
//      }}
//    if(homeGX.famousProducts.isNotEmpty){
//      final indexFp= homeGX.famousProducts.indexWhere((element) => element.id==id);
//      if(indexFp>=0){
//        final temp = homeGX.famousProducts[indexFp];
//        temp.isFavorite=!temp.isFavorite;
//        homeGX.famousProducts[indexFp]=temp;
//      }}
//
//
//    ///update on favorites list
//    await indexFavoriteProducts();
//    return true;
//  }else{
//    Get.snackbar('Success', decoded['message'],duration: Duration(seconds:1));
//    return false;
//  }
//}