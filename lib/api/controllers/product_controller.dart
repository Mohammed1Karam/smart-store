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
