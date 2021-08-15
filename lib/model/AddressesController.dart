import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/controllers/CitiesController.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/model/address.dart';
import '../api/api_settings.dart';
import 'dart:io';
import 'dart:convert';

class AddressesController {
  final token = Get.find<UserController>().user.value!.token;
//  final citiesGx = Get.find<CityController>();
  final citiesGx = Get.put(CityController());

  RxList<Address> addresses = <Address>[].obs;

  Future<bool> addressesIndex() async {
    final url = Uri.parse(ApiSettings.ADDRESSES);
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: token,
      'X-Requested-With': 'XMLHttpRequest'
    });
    final decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var mappedAddresses = decoded['list'] as List;
      mappedAddresses = mappedAddresses.reversed.toList();
      addresses.value =
          mappedAddresses.map((e) => Address.fromJson(e)).toList();
      return true;
    } else {
      addresses.clear();
      return false;
    }
  }

  Future<bool> createAddress(
      {required String name,
      required String info,
      required String contactNumber,
      required int cityId}) async {
    final url = Uri.parse(ApiSettings.ADDRESSES);
    final response = await http.post(url, body: {
      'name': name,
      'info': info,
      'contact_number': contactNumber,
      'city_id': cityId.toString(),
    }, headers: {
      HttpHeaders.authorizationHeader: token,
      'X-Requested-With': 'XMLHttpRequest'
    });
    final decoded = jsonDecode(response.body);
    if (response.statusCode > 201) {
      Get.snackbar('Error', decoded['message']);
      return false;
    } else {
      Get.snackbar('Success', decoded['message']);
      final newAddress = Address.fromJson(decoded['object']);
//      newAddress.cities = citiesGx.cities(newAddress.cityId);
      addresses.insert(0, newAddress);
      return true;
    }
  }

  Future<bool> updateAddress(Address editedAddress) async {
    final url = Uri.parse(
        ApiSettings.ADDRESSES + '/' + editedAddress.id.toString());
    final response = await http.put(url, body: {
      'name': editedAddress.name,
      'info': editedAddress.info,
      'contact_number': editedAddress.contactNumber,
      'city_id': editedAddress.cityId.toString(),
    }, headers: {
      HttpHeaders.authorizationHeader: token,
      'X-Requested-With': 'XMLHttpRequest'
    });
    final decoded = jsonDecode(response.body);
    if (response.statusCode > 201) {
      Get.snackbar('Error', decoded['message']);
      return false;
    } else {
      Get.snackbar('Success', decoded['message']);
      final index =
          addresses.indexWhere((element) => element.id == editedAddress.id);
      addresses[index] = editedAddress;
// final newAddress = Address.fromJson(decoded['object']);
// newAddress.city = citiesGx.getCityById(newAddress.cityId);
// addresses.insert(0, newAddress);
      return true;
    }
  }

  Future<bool> deleteAddress(int id) async {
    final url = Uri.parse(ApiSettings.ADDRESSES + '/' + id.toString());
    final response = await http.delete(url, headers: {
      HttpHeaders.authorizationHeader: token,
      'X-Requested-With': 'XMLHttpRequest'
    });
    final decoded = jsonDecode(response.body);
    if (response.statusCode > 200) {
      Get.snackbar('Error', decoded['message']);
      return false;
    } else {
      Get.snackbar('Success', decoded['message']);
      final index = addresses.indexWhere((element) => element.id == id);
      addresses.removeAt(index);
      addresses.refresh();

      return true;
    }
  }
}
