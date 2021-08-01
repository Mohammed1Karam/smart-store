import 'package:flutter/cupertino.dart';

class LanguageChangeNotifier extends ChangeNotifier{

  Locale _locale;

  LanguageChangeNotifier(this._locale);

  Locale get locale => _locale;

  void changeLocale(Locale locale){
    this._locale = locale;
    notifyListeners();
  }
}