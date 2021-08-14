
import 'package:smart_store/model/city.dart';

class User {
  late int id;
  late String name;
  late String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late int cityId;
  late int storeId;
  late String token;
  late String tokenType;
  late String refreshToken;
//  late City city;
//  late List<City> city;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    token = 'Bearer ${json['token']}';
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
//    if (json['City'] != null) {
//      city = <City>[];
//      json['categories'].forEach((v) {
//        city.add( City.fromJson(v));
//      });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['active'] = this.active;
    data['verified'] = this.verified;
    data['city_id'] = this.cityId;
    data['store_id'] = this.storeId;
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
//    if (this.city != null) {
//      data['city'] = this.city.toJson();
//    }
    return data;
  }
}

