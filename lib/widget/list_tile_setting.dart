import 'package:flutter/material.dart';

class ListTileSetting extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget widget;
  final Color color;
  final  Function()? onTap;

  ListTileSetting({
    required this.icon,
    required this.text,
    required this.widget,
    required  this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: color,
          width: 1,
        ),
      ),
      elevation: 3,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 22,
          color: Color(0xff0D0E56),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
            color: Color(0xff0D0E56),
          ),
        ),
        trailing: widget,
      ),
    );
  }
}
