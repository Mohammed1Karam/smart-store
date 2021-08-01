import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store/model/user.dart';

class UserSharedPrefController {
  static final UserSharedPrefController _instance =
      UserSharedPrefController._internal();
  late final SharedPreferences _sharedPreferences;

  factory UserSharedPrefController() {
    return _instance;
  }

  UserSharedPrefController._internal();

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future save(User user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('full_name', user.name);
    await _sharedPreferences.setString('email', user.email!);
    await _sharedPreferences.setString('mobile', user.mobile);
    await _sharedPreferences.setString('tokenType', user.tokenType);
    await _sharedPreferences.setBool('active', user.active);
    await _sharedPreferences.setBool('verified', user.verified);
    await _sharedPreferences.setInt('cityId', user.cityId);
    await _sharedPreferences.setInt('storeId', user.storeId);
    await _sharedPreferences.setString('token', user.token);
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool('logged_in') ?? false;
  }

  String getToken() {
    String token = _sharedPreferences.getString('token') ?? '';
    return 'Bearer $token';
  }

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
}
