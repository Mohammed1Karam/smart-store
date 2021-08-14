class ApiSettings {

  static const _API_BASE_URL = "https://smart-store.mr-dev.tech/api/";

  // static const INDEX_USERS = _API_BASE_URL + 'users';
  static const USERS_LOGIN = _API_BASE_URL + 'auth/login';
  static const USERS_LOGOUT = _API_BASE_URL + 'auth/logout';
  static const USERS_FORGET_PASSWORD = _API_BASE_URL + 'auth/forget-password';
  static const USERS_RESET_PASSWORD = _API_BASE_URL + 'auth/reset-password';
  static const USERS_REGISTER_PASSWORD = _API_BASE_URL + 'auth/register';
  static const USERS_activate = _API_BASE_URL + 'auth/activate';

  static const CITY_GET = _API_BASE_URL + 'cities';
  static const CATEGORIES_GET = _API_BASE_URL + 'categories';
  static const SUB_CATEGORIES_GET = _API_BASE_URL + 'categories/';
  static const PRODUCT_GET = _API_BASE_URL + 'sub-categories/';
  static const HOME = _API_BASE_URL + 'home';

  static const ADDRESSES= _API_BASE_URL + 'addresses';
}