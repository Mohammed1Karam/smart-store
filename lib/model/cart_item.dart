class CartItem{
  late int userId;
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String imageUrl;
  late num price;
//  late double overallRate;
  late double? offerPrice;
  late int quantity;
  late int cartQuantity;

  CartItem({
    required this.userId,
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.infoEn,
    required this.infoAr,
    required this.price,
//    required this.overallRate,
    required this.quantity,
    required this.cartQuantity,
    required this.imageUrl,
    this.offerPrice,
  });

  CartItem.fromMap(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    imageUrl = json['image_url'];
    price = json['price'];
//    overallRate = json['overall_rate'];
    offerPrice = json['offer_price']==0?null:json['offer_price'];
    quantity = json['quantity'];
    cartQuantity = json['cart_quantity'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id']=userId;
    data['id']=id;
    data['name_en']=nameEn;
    data['name_ar']=nameAr;
    data['info_en']=infoEn;
    data['info_ar']=infoAr;
    data['image_url']=imageUrl;
    data['price']=price;
//    data['overall_rate']=overallRate;
    data['offer_price']=offerPrice!=null?offerPrice:0;
    data['quantity']=quantity;
    data['cart_quantity']=cartQuantity;
    return data;
  }
}
