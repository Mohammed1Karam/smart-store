import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';

class TextFieldA extends StatelessWidget {
  final TextInputType textInputType;
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  TextFieldA({
    this.textInputType = TextInputType.text,
    this.obscureText = false,
   required  this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'Montserrat',
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.W200_COLOR,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.COLOR,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
