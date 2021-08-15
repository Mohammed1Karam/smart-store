class CreditCard {
  late String holderName;
  late String cardNumber;
  late DateTime expDate;
  late String cvv;
  late String type;
  late int userId;
  late String updatedAt;
  late String createdAt;
  late int id;
  late bool isSelected;
  CreditCard(
      {
        required this.holderName,
        required this.cardNumber,
        required this.expDate,
        required this.cvv,
        required this.type,
        required this.userId,
        required this.id,
        this.isSelected = false,
      });

  CreditCard.fromJson(Map<String, dynamic> json) {
  holderName = json['holder_name'];
  cardNumber = json['card_number'];
  expDate = DateTime.parse(json['exp_date']);
  cvv = json['cvv'].toString();
  type = json['type'];
  userId = json['user_id'];
  updatedAt = json['updated_at'];
  createdAt = json['created_at'];
  id = json['id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['holder_name'] = this.holderName;
  //   data['card_number'] = this.cardNumber;
  //   data['exp_date'] = this.expDate;
  //   data['cvv'] = this.cvv;
  //   data['type'] = this.type;
  //   data['user_id'] = this.userId;
  //   data['updated_at'] = this.updatedAt;
  //   data['created_at'] = this.createdAt;
  //   data['id'] = this.id;
  //   return data;
  // }
}