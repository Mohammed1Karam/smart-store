import 'package:smart_store/model/product/product.dart';

class BaseProduct<T> {
 late bool status;
 late String message;
// late List<Product> list;
  late List<T> products = <T>[];


 BaseProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      if(T == Product){
        print('WE ARE HERE');
        products = <T>[].cast<T>();
        json['data'].forEach((v) {
          products.add(Product.fromJson(v) as T);
        });
      }
      // else if(T == Category){
      //
      // }
    }
  }

}

