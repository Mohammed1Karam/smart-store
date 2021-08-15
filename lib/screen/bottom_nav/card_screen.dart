import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_store/api/controllers/credit_card_controller.dart';
import 'package:smart_store/screen/add_card_screen.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_buttonD.dart';
import 'package:smart_store/widget/expanded_text_field.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:badges/badges.dart';
import 'package:favorite_button/favorite_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final cardsGX = Get.put(CreditCardController());
  late Future<bool> indexCards;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexCards = cardsGX.indexCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.COLOR,
        elevation: 0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          side: BorderSide(
            color: AppColors.COLOR,
            width: 1,
          ),
        ),
        title: MyText(
            text: 'Payment Cards',
            fText: 'Merienda',
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColors.Auth_COLOR),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddCardScreen()));
            },
            child: Icon(Icons.add, size: 45),
          ),
        ],
      ),
      body: cardsGX.creditCards.isNotEmpty
          ? Center(
              child: Text('No payment cards added yet'),
            )
          : Column(
              children: [
                Expanded(
                    child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.white
                            ],
                            stops: [
                              0.0,
                              0.03,
                              0.97,
                              1.0
                            ], // 10% purple, 80% transparent, 10% purple
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: Obx(
                          () => ListView.separated(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.scaleHeight(15)),
                            physics: BouncingScrollPhysics(),
                            itemCount: cardsGX.creditCards.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: SizeConfig.scaleWidth(0)),
                            itemBuilder: (context, index) => Stack(
                              children: [
                                CreditCardWidget(
                                  textStyle: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: SizeConfig.scaleTextFont(18),
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                  cardType:
                                      cardsGX.creditCards[index].type == 'Visa'
                                          ? CardType.visa
                                          : CardType.mastercard,
                                  cardNumber:
                                      cardsGX.creditCards[index].cardNumber,
                                  expiryDate: DateFormat('M/yy')
                                      .format(
                                          cardsGX.creditCards[index].expDate)
                                      .toString(),
                                  cardHolderName:
                                      cardsGX.creditCards[index].holderName,
                                  cvvCode: cardsGX.creditCards[index].cvv,
                                  showBackView: false,
                                  obscureCardNumber: true,
                                  obscureCardCvv: true,
                                  cardBgColor: Colors.black,
                                  labelExpiredDate: 'Expiry Date',
                                  //labelCardHolder: 'Card Holder',
                                ),
                                Positioned(
                                  right: 20,
                                  bottom: 25,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
//                                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCardScreen(editableCard: cardsGX.creditCards[index],)));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                            size: 30,
                                          )),
                                      SizedBox(
                                          width: SizeConfig.scaleHeight(15)),
                                      IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: 'Remove Card',
                                              content: MyText(
                                                  text:
                                                      'Are you sure about removing this card ?',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.COLOR),
                                              textCancel: 'Cancel',
                                              textConfirm: 'Delete',
                                              cancelTextColor: Colors.black,
                                              confirmTextColor: Colors.white,
                                              onConfirm: () async {
                                                Get.back();
                                                await cardsGX.deleteCard(cardsGX
                                                    .creditCards[index].id);
                                              },
                                              titleStyle: TextStyle(
                                                fontFamily: 'Mont',
                                              ),
                                              buttonColor: Colors.black,
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))),
              ],
            ),
    );
  }
}
