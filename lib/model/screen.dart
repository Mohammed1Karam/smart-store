
import 'package:flutter/cupertino.dart';

class BottomNavigationBarScreen{
  String _titel;
  Widget _widget;

  BottomNavigationBarScreen(this._titel, this._widget);

  Widget get widget => _widget;

  set widget(Widget value) {
    _widget = value;
  }

  String get titel => _titel;

  set titel(String value) {
    _titel = value;
  }
}