import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/model/city.dart';
import 'package:http/http.dart' as http;

class CityController {
  final token = Get.find<UserController>().user.value!.token;

  RxList<City> cities = <City>[].obs;

  //var categories = <Category>[].obs;
//List<Category> categories = <Category>[].obs;
  var m = 0.obs;

  Future<bool> citiesIndex() async {
    final url = Uri.parse(ApiSettings.CITY_GET);
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: token,
      'Accept': 'application/json'
    });
//     print(token);
//     print(response.statusCode);
//     print(response.statusCode);

    final decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final mappedCities = decoded['list'] as List;
      cities.value = mappedCities.map((e) => City.fromJson(e)).toList();
      cities.refresh();
      return true;
    } else {
      return false;
    }
  }
}
/*
* class CityController {


  Future<List<City>> cityUser() async {
    var url = Uri.parse(ApiSettings.USER_CITIES);
    var response = await http.get(url, headers: {
     // 'Accept-Encoding' : 'gzip, deflate, br',
     // 'Connection' : 'keep-alive',
     'Accept' : 'application/json',
    });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var citiesJsonArray = jsonResponse['list'] as List;
        return citiesJsonArray.map((citiesJsonObject) => City.fromJson(citiesJsonObject)).toList();
      }
    return [];
    }
  }*/