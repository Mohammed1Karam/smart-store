import 'package:flutter/material.dart';
import 'package:smart_store/model/home/categories.dart';
import 'package:smart_store/model/home/famous_products.dart';
import 'package:smart_store/model/home/latestProducts.dart';
import 'package:smart_store/model/home/categories.dart';

class Home {
 late List<Slider> slider;
 late List<Categories> categories;
 late List<LatestProducts> latestProducts;
 late List<FamousProducts> famousProducts;


  Home.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
//        slider.add(new Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add( Categories.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts =  <LatestProducts>[];
      json['latest_products'].forEach((v) {
        latestProducts.add(LatestProducts.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <FamousProducts>[];
      json['famous_products'].forEach((v) {
        famousProducts.add(new FamousProducts.fromJson(v));
      });
    }
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.slider != null) {
//      data['slider'] = this.slider.map((v) => v.toJson()).toList();
//    }
//    if (this.categories != null) {
//      data['categories'] = this.categories.map((v) => v.toJson()).toList();
//    }
//    if (this.latestProducts != null) {
//      data['latest_products'] =
//          this.latestProducts.map((v) => v.toJson()).toList();
//    }
////    if (this.famousProducts != null) {
////      data['famous_products'] =
////          this.famousProducts.map((v) => v.toJson()).toList();
////    }
//    return data;
//  }
}