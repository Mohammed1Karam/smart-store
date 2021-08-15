import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_store/api/controllers/credit_card_controller.dart';
import 'package:smart_store/model/credit_card.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/elevated_button_custom.dart';
import 'package:smart_store/widget/login_textField.dart';
import 'package:smart_store/widget/my_text.dart';
class AddCardScreen extends StatefulWidget {
   CreditCard? editableCard;
   AddCardScreen({this.editableCard});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen>{

  final cardsGX = Get.find<CreditCardController>();
  
  late TextEditingController cardNumberController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cvvCodeController;
  late TextEditingController expiryDateController;

  Color cardNumberTextColor = AppColors.Auth_COLOR;
  Color cardNumberHintTextColor = AppColors.COLOR;
  Color cardNumberCursorColor = AppColors.Auth_COLOR;
  Color cardNumberBorderColor = AppColors.Auth_COLOR;

  Color cardHolderNameTextColor = AppColors.Auth_COLOR;
  Color cardHolderNameHintTextColor = AppColors.COLOR;
  Color cardHolderNameCursorColor =  AppColors.Auth_COLOR;
  Color cardHolderNameBorderColor =  AppColors.Auth_COLOR;

  Color cvvCodeTextColor = AppColors.Auth_COLOR;
  Color cvvCodeHintTextColor =  AppColors.COLOR;
  Color cvvCodeCursorColor =  AppColors.Auth_COLOR;
  Color cvvCodeBorderColor =  AppColors.Auth_COLOR;

  Color expiryDateTextColor = AppColors.Auth_COLOR;
  Color expiryDateHintTextColor = AppColors.Auth_COLOR;
  Color expiryDateCursorColor = AppColors.Auth_COLOR;
  Color expiryDateBorderColor = AppColors.Auth_COLOR;

  bool cardNumberStatus = false;
  bool cardHolderNameStatus = false;
  bool cvvCodeStatus = false;
  bool expiryDateStatus = false;

  List<CardType> creditCardType=[CardType.visa,CardType.mastercard];
  CardType? selectedCardType;
  DateTime? expiryDate;
  Color radioButtonsTextColor = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardNumberController = TextEditingController();
    cardHolderNameController = TextEditingController();
    cvvCodeController = TextEditingController();
    expiryDateController = TextEditingController();

    if(widget.editableCard!=null){
      cardNumberController.text=widget.editableCard!.cardNumber;
      cardHolderNameController.text=widget.editableCard!.holderName;
      cvvCodeController.text=widget.editableCard!.cvv;
      expiryDate = widget.editableCard!.expDate;
      expiryDateController.text=DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(expiryDate!);
      selectedCardType=widget.editableCard!.type=='Visa'?CardType.visa:CardType.mastercard;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    cvvCodeController.dispose();
    expiryDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(0)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(height: SizeConfig.scaleHeight(20)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: SizeConfig.scaleWidth(5)),

                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                                width: 35,
                                child: Image.asset('images/arrow_b.png'))),
                        Spacer(),
                        MyText(text: widget.editableCard!=null?'Update Card':'Add New Card', fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.Auth_COLOR,),
                        Spacer(),
                        SizedBox(width: 35)
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(5)),
                  CreditCardWidget(
                    textStyle: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: SizeConfig.scaleTextFont(18),
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                    cardType: selectedCardType,
                    cardNumber: GetUtils.isNumericOnly(cardNumberController.text)==true?cardNumberController.text:'',
                    expiryDate: expiryDate!=null?DateFormat('M/yy').format(expiryDate!).toString():'',
                    cardHolderName: cardHolderNameController.text,
                    cvvCode: cvvCodeController.text,
                    showBackView: false,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    cardBgColor: Colors.black,
                    labelExpiredDate:'Expiry Date',
                    //labelCardHolder: 'Card Holder',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: SizeConfig.scaleHeight(20)),
                        MyText(text: 'Card Number', fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.Auth_COLOR,),
                        LoginTextField(
                          textInputType: TextInputType.phone,
                          controller: cardNumberController,
                          hint: 'Enter your card number',
                          textColor: cardNumberTextColor,
                          hintColor: cardNumberHintTextColor,
                          cursorColor: cardNumberCursorColor,
                          borderColor: cardNumberBorderColor,
                          maxLength: 16,
                          suffix: Visibility(
                              visible: cardNumberStatus,
                              child:Icon(Icons.check_circle,color: Colors.black)),
                          onChanged: (value){
                            setState(() {
                               cardNumberStatus =checkCardNumber(value);
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(20)),

                        SizedBox(
                          height: SizeConfig.scaleHeight(30),
                          child: Row(
                            children: <Widget>[
                              addRadioButton(0, 'Visa'),
                              addRadioButton(1, 'Master Card'),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(20)),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyText(text: 'CVV Code', fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.Auth_COLOR),
                                  LoginTextField(
                                    textInputType: TextInputType.number,
                                    controller: cvvCodeController,
                                    hint: 'Enter CVV',
                                    textColor: cvvCodeTextColor,
                                    hintColor: cvvCodeHintTextColor,
                                    cursorColor: cvvCodeCursorColor,
                                    borderColor: cvvCodeBorderColor,
                                    maxLength: 3,
                                    suffix: Visibility(
                                        visible: cvvCodeStatus,
                                        child:Icon(Icons.check_circle,color: Colors.black)),
                                    onChanged: (value){
                                      setState(() {
                                         cvvCodeStatus =checkCCVCode(value);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: SizeConfig.scaleWidth(20)),

                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: 'Expiry Date', fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.Auth_COLOR,),
                                  LoginTextField(
                                    readOnly: true,
                                    onTapTF: ()async{
                                      expiryDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now().add(Duration(days: 60)),
                                          firstDate: DateTime.now().add(Duration(days: 60)),
                                          lastDate: DateTime(2025));
                                      if(expiryDate!=null){
                                        setState(() {
                                          expiryDateController.text=DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(expiryDate!);
                                          checkExpiryDate();
                                        });
                                      }
                                    },
                                    controller: expiryDateController,
                                    hint: 'Pick a date',
                                    textColor: expiryDateTextColor,
                                    hintColor: expiryDateHintTextColor,
                                    cursorColor: expiryDateCursorColor,
                                    borderColor: expiryDateBorderColor,
                                    suffix: Visibility(
                                        visible: expiryDate!=null,
                                        child:Icon(Icons.check_circle,color: Colors.black)),
                                    onChanged: (_){},

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(20)),
                        MyText(text: 'Card Holder Name', fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.Auth_COLOR),
                        LoginTextField(
                          controller: cardHolderNameController,
                          hint: 'Enter card holder name',
                          textColor: cardHolderNameTextColor,
                          hintColor: cardHolderNameHintTextColor,
                          cursorColor: cardHolderNameCursorColor,
                          borderColor: cardHolderNameBorderColor,
                          maxLength: 15,
                          suffix: Visibility(
                              visible: cardHolderNameStatus,
                              child:Icon(Icons.check_circle,color: Colors.black)),
                          onChanged: (value){
                            setState(() {
                               cardHolderNameStatus =checkCardHolderName(value);
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(30)),
                        ElevatedButtonCustom(
                          buttonTitle: widget.editableCard!=null?'Update':'Add Card',
                          borderSide: BorderSide.none,
                          height: 50,
                          width: double.infinity,
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: perform,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget addRadioButton(int btnValue, String title) {
    return Row(
      children:[
        Radio<CardType>(
          activeColor: Colors.black,
          value: creditCardType[btnValue],
          groupValue: selectedCardType,
          onChanged: (value){
            setState(() {
              radioButtonsTextColor = Colors.black;
              selectedCardType=value;
            });
          },
        ),
        MyText(text: title, fontSize: 16,fontWeight: FontWeight.w600,color: radioButtonsTextColor)
      ],
    );
  }
  bool checkCardNumber(String value){
    if(value.length==16 && GetUtils.isNumericOnly(value)){
      cardNumberTextColor = Colors.black;
      cardNumberHintTextColor = AppColors.Auth_COLOR;
      cardNumberCursorColor = Colors.black;
      cardNumberBorderColor = AppColors.Auth_COLOR;
      return true;
    }
    else {
      cardNumberTextColor = Colors.red;
      cardNumberHintTextColor = Colors.red;
      cardNumberCursorColor = Colors.red;
      cardNumberBorderColor = Colors.red;
      return false;
    }
  }
  bool checkCCVCode(String value){
    if(value.length==3 && GetUtils.isNumericOnly(value)){
      cvvCodeTextColor = Colors.black;
      cvvCodeHintTextColor = AppColors.Auth_COLOR;
      cvvCodeCursorColor = Colors.black;
      cvvCodeBorderColor = AppColors.Auth_COLOR;
      return true;
    }
    else {
      cvvCodeTextColor = Colors.red;
      cvvCodeHintTextColor = Colors.red;
      cvvCodeCursorColor = Colors.red;
      cvvCodeBorderColor = Colors.red;
      return false;
    }
  }
  bool checkCardType(){
    if(selectedCardType!=null){
      radioButtonsTextColor = Colors.black;
      return true;
    }else{
      radioButtonsTextColor = Colors.red;
      return false;
    }
  }
  bool checkExpiryDate(){
    if(expiryDate!=null){
      expiryDateTextColor = Colors.black;
      expiryDateHintTextColor = AppColors.COLOR;
      expiryDateCursorColor = Colors.black;
      expiryDateBorderColor = AppColors.Auth_COLOR;
      return true;
    }else{
      expiryDateTextColor = Colors.red;
      expiryDateHintTextColor = Colors.red;
      expiryDateCursorColor = Colors.red;
      expiryDateBorderColor = Colors.red;
      return false;
    }
  }
  bool checkCardHolderName(String value){
    if(value.length>=10 && GetUtils.isAlphabetOnly(value.replaceAll(' ', ''))){
      cardHolderNameTextColor = Colors.black;
      cardHolderNameHintTextColor = AppColors.COLOR;
      cardHolderNameCursorColor = Colors.black;
      cardHolderNameBorderColor = AppColors.Auth_COLOR;
      return true;
    }
    else {
      cardHolderNameTextColor = Colors.red;
      cardHolderNameHintTextColor = Colors.red;
      cardHolderNameCursorColor = Colors.red;
      cardHolderNameBorderColor = Colors.red;
      return false;
    }
  }
  bool checkAll(){
    if(checkCardNumber(cardNumberController.text)&&
        checkCCVCode(cvvCodeController.text)&&
        checkCardType()&&
        checkExpiryDate()&&
        checkCardHolderName(cardHolderNameController.text)
    ){
      return true;
    }else{
      setState(() {
        if(cardNumberController.text.isEmpty){
          cardNumberBorderColor= Colors.red;
          cardNumberHintTextColor = Colors.red;
          cardNumberCursorColor = Colors.red;
        }
        if(cvvCodeController.text.isEmpty){
          cvvCodeBorderColor= Colors.red;
          cvvCodeHintTextColor = Colors.red;
          cvvCodeCursorColor = Colors.red;
        }
        if(cardHolderNameController.text.isEmpty){
          cardHolderNameBorderColor= Colors.red;
          cardHolderNameHintTextColor = Colors.red;
          cardHolderNameCursorColor = Colors.red;
        }
        if(selectedCardType==null){
          radioButtonsTextColor = Colors.red;
        }
        if(expiryDate==null){
          expiryDateBorderColor= Colors.red;
          expiryDateHintTextColor = Colors.red;
          expiryDateCursorColor = Colors.red;
        }
      });
      Get.snackbar('Adding Failed', 'Please check required data',duration: Duration(milliseconds: 1500));
      return false;
    }
  }
  void perform()async{
     if(checkAll()){
       bool result;
       if(widget.editableCard!=null){
         widget.editableCard!.cardNumber=cardNumberController.text;
         widget.editableCard!.holderName=cardHolderNameController.text;
         widget.editableCard!.cvv=cvvCodeController.text;
         widget.editableCard!.type = selectedCardType==CardType.visa?'Visa':'Master';
         widget.editableCard!.expDate= expiryDate!;

         result = await cardsGX.updateCard(widget.editableCard!);


       }else{
          result = await cardsGX.createCard(
           holderName: cardHolderNameController.text,
           cardNumber: cardNumberController.text,
           expiryDate: DateFormat('y-M-d').format(expiryDate!),
           ccvCode: cvvCodeController.text,
           type: selectedCardType==CardType.visa?'Visa':'Master',
         );
       }
       if(result){
         Navigator.pop(context);
       }

     }
  }

}