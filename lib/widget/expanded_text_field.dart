import 'package:flutter/material.dart';

class ExpandedTextField extends StatefulWidget {
  // final TextEditingController controller;
  final  Function()? onTap;

  ExpandedTextField({
    // required this.controller,
     this.onTap,
  });

  @override
  _ExpandedTextFieldState createState() => _ExpandedTextFieldState();
}

class _ExpandedTextFieldState extends State<ExpandedTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: TextField(
          // controller: controller,
          cursorColor: Colors.black,
          maxLines: null,
          minLines: null,
          expands: true,
          showCursor: true,
          readOnly: true,
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: Colors.blue,
            filled: true,
            counterText: '',
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.5,
                  // style: BorderStyle.solid,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0,
                  // style: BorderStyle.solid,
                )),
          ),
        ),
      ),
    );
  }
// Future<bool> colors(bool color) async{
//   if(color == false){
//     return color =  Colors.white as bool;
//
//   }
//   return color =  Colors.blue as bool;
// }
}
