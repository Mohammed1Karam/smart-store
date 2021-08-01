import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  static final SharedPrefController _instance =
  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  //PRIVATE CONSTRUCTOR - NO DEFAULT
  SharedPrefController._internal();

  Future<void> initSharePreferences() async {

    _sharedPreferences = await SharedPreferences.getInstance();

  }

  SharedPreferences get preferences => _sharedPreferences;

  Future<bool> changeLanguage(String langCode) async {
    return await _sharedPreferences.setString('lang_code', langCode);
  }

  String currentLanguage() {
    return _sharedPreferences.getString('lang_code') ?? 'en';
  }
}
