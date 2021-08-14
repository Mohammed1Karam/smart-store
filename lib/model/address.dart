import 'city.dart';

class Address <T> {
 late int id;
 late String name;
 late String info;
 late String contactNumber;
 late Null lat;
 late Null lang;
 late int cityId;
// late City city;
  late List<T> cities = <T>[];


  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
//    city = (json['city'] != null ? new City.fromJson(json['city']) : null)!;
    if (json['data'] != null) {
      if(T == City){
        print('WE ARE HERE');
        cities = <T>[].cast<T>();
        json['data'].forEach((v) {
          cities.add(City.fromJson(v) as T);
        });
      }
  }
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['name'] = this.name;
//    data['info'] = this.info;
//    data['contact_number'] = this.contactNumber;
//    data['lat'] = this.lat;
//    data['lang'] = this.lang;
//    data['city_id'] = this.cityId;
//    if (this.city != null) {
//      data['city'] = this.city.toJson();
//    }
//    return data;
  }
}