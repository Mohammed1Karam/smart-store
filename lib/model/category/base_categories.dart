import 'package:smart_store/model/category/categories.dart';

class BaseCategories <T>{
 late bool status;
 late String message;
 late List<T> categories = <T>[];


  BaseCategories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      if(T == Category){
        print('WE ARE HERE');
        categories = <T>[].cast<T>();
        json['data'].forEach((v) {
          categories.add(Category.fromJson(v) as T);
        });
      }
      // else if(T == Category){
      //
      // }
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['message'] = this.message;
  //   if (this.categories != null) {
  //     data['list'] = this.categories.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
