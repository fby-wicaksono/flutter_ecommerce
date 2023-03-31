import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceKey {
  hasUserOnboard('has_user_onboard'),
  hasLogin('has_login');

  final String key;

  const SharedPreferenceKey(this.key);
}

class SharedPreferenceManager {
  static late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  bool get hasUserOnboard {
    return _pref.getBool(SharedPreferenceKey.hasUserOnboard.key) ?? false;
  }

  void setUserDoneOnboard() {
    _pref.setBool(SharedPreferenceKey.hasUserOnboard.key, true);
  }

  void setDoneLogin(String username) {
    _pref.setBool(SharedPreferenceKey.hasLogin.key, true);
  }

  bool get hasUserLogin {
    return _pref.getBool(SharedPreferenceKey.hasLogin.key) ?? false;
  }

  void setLogout() {
    _pref.setBool(SharedPreferenceKey.hasLogin.key, false);
  }
}