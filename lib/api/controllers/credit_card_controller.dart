import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/model/credit_card.dart';
import '../api_settings.dart';
import 'dart:io';
import 'dart:convert';

class CreditCardController extends GetxController{
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await indexCards();
  }
  final token = Get.find<UserController>().user.value!.token;
  RxList<CreditCard> creditCards = <CreditCard>[].obs;


  Future<bool> indexCards()async{
    final url = Uri.parse(ApiSettings.CARDS_CRUD_URL);
    final response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:token,
      'X-Requested-With':'XMLHttpRequest'});
    final decoded = jsonDecode(response.body);

    if(response.statusCode==200){
      var mappedCards = decoded['list'] as List;

      mappedCards = mappedCards.reversed.toList();
      creditCards.value = mappedCards.map((e) => CreditCard.fromJson(e)).toList();
      return true;
    }else{
      creditCards.clear();
      return false;
    }
  }
  Future<bool> createCard({required String holderName,required String cardNumber, required String expiryDate, required String ccvCode, required String type})async{
    final url=Uri.parse(ApiSettings.CARDS_CRUD_URL);
    final response = await http.post(url,body:{
       'holder_name':holderName,
       'card_number':cardNumber,
       'exp_date':expiryDate,
       'cvv':ccvCode,
       'type':type,
    },
        headers:{
          HttpHeaders.authorizationHeader:token,
          'X-Requested-With':'XMLHttpRequest'
        }
    );
    final decoded = jsonDecode(response.body);
    if(response.statusCode>201){
      Get.snackbar('Error',decoded['message']);
      return false;
    }else{
      Get.snackbar('Success',decoded['message']);
      final newCard = CreditCard.fromJson(decoded['object']);
      creditCards.insert(0, newCard);
      return true;
    }
  }
  Future<bool> deleteCard(int id)async{
    final url=Uri.parse(ApiSettings.CARDS_CRUD_URL+'/'+id.toString());
    final response = await http.delete(url,
        headers:{
          HttpHeaders.authorizationHeader:token,
          'X-Requested-With':'XMLHttpRequest'
        });
    final decoded = jsonDecode(response.body);
    if(response.statusCode>200){
      Get.snackbar('Error',decoded['message']);
      return false;
    }else{
      Get.snackbar('Success',decoded['message']);
      final index = creditCards.indexWhere((element) => element.id==id);
      creditCards.removeAt(index);
      return true;
    }
  }
  Future<bool> updateCard(CreditCard editedCreditCard)async{
    final url=Uri.parse(ApiSettings.CARDS_CRUD_URL+'/'+editedCreditCard.id.toString());
    final response = await http.put(url,body:{
      'holder_name':editedCreditCard.holderName,
      'card_number':editedCreditCard.cardNumber,
      'exp_date':DateFormat('y-M-d').format(editedCreditCard.expDate),
      'cvv':editedCreditCard.cvv,
      'type':editedCreditCard.type,},
        headers:{
          HttpHeaders.authorizationHeader:token,
          'X-Requested-With':'XMLHttpRequest'
        }
    );
    final decoded = jsonDecode(response.body);
    if(response.statusCode>201){
      Get.snackbar('Error',decoded['message']);
      return false;
    }else{
      Get.snackbar('Success',decoded['message']);
      final index = creditCards.indexWhere((element) => element.id==editedCreditCard.id);
      creditCards[index] = editedCreditCard;

      return true;
    }
  }

}