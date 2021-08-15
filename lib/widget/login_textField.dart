import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? suffix;
  Function(String value)? onChanged;
  final Color textColor;
  final Color borderColor;
  final Color hintColor;
  final Color cursorColor;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final bool obSecureText;
  final int maxLength;
  GestureTapCallback? onTapTF;
  final bool readOnly;
  

  LoginTextField({
    required this.controller,
    required this.hint,
    this.textInputType = TextInputType.text,
    this.obSecureText = false,
    this.readOnly = false,
    this.focusNode,
     this.suffix,
    this.maxLength = 20,
    this.onChanged,
    this.textColor = Colors.black,
    this.hintColor = AppColors.COLOR,
    this.borderColor = AppColors.Auth_COLOR,
    this.cursorColor = Colors.black,
    this.onTapTF,
    
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.scaleHeight(45),
      child: TextField(
        readOnly: widget.readOnly,
        onTap: widget.onTapTF,
        obscureText: widget.obSecureText,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: widget.cursorColor,
        onChanged:widget.onChanged,
        maxLength: widget.maxLength,
        style: TextStyle(
          color: widget.textColor,
          fontFamily: 'Mont',
          fontSize: SizeConfig.scaleTextFont(16),
        ),
        maxLines: 1,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(
          //   top:20 ),
            counterText: '',
            enabledBorder: border,
            focusedBorder: border,
            hintText: widget.hint,
            hintStyle:TextStyle(
          color: widget.hintColor,
          fontFamily: 'Mont',
          fontSize: SizeConfig.scaleTextFont(16),
        ),
            suffixIcon: widget.suffix,
        ),
      ),
    );
  }

  InputBorder get border {
    return UnderlineInputBorder(
        borderSide: BorderSide(
          color: widget.borderColor,
        )
    );
  }
  
}
