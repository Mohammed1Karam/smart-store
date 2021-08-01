import 'package:flutter/material.dart';
import 'package:smart_store/utils/size_config.dart';

class PinTextField extends StatelessWidget {
  late final TextEditingController controller;
  late final Color bgColor;

  PinTextField(this.controller, this.bgColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.scaleWidth(40),
      height: SizeConfig.scaleHeight(40),
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
        maxLines: 1,
        enabled: false,
        controller: controller,
        onChanged: (val) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor: bgColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
