import 'package:roz_dhan/models/response/user_signup_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<bool> isUserLoggedIn() async {
    await init();
    return _prefs?.getString("isUserLoggedIn") == "true";
  }

  static Future<void> saveUserData(UserSignupRes data) async {
    await init();
    await _prefs?.setString("userId", data.userId.toString());
    await _prefs?.setString("securityToken", data.securityToken);
    await _prefs?.setString("isUserLoggedIn", "true");
  }
}
