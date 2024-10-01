import 'package:google_sign_in/google_sign_in.dart';
import 'package:roz_dhan/models/request/user_signup_req.dart';
import 'package:roz_dhan/utils.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class GoogleLogin {
  static Future<http.Response?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();

      if (user == null) {
        return null; // User cancelled the sign-in
      }

      String adId = await Utils.getAdvertisingId();
      Map<String, String> deviceInfo = await Utils.getDeviceInfo();
      Map<String, String> versionInfo = await Utils.getVersionInfo();

      UserSignupReq userSignup = UserSignupReq(
        deviceId: deviceInfo["deviceId"] ?? '',
        deviceType: deviceInfo["deviceType"] ?? '',
        deviceName: deviceInfo["deviceName"] ?? '',
        socialName: user.displayName ?? '',
        socialEmail: user.email,
        socialImgurl: user.photoUrl ?? '',
        versionName: versionInfo["versionName"] ?? '',
        versionCode: versionInfo["versionCode"] ?? '',
        advertisingId: adId,
      );

      // Await the sendData call to get the response
      final response = await sendData(userSignup);
      return response;
    } catch (error) {
      print("Error during Google Sign-In: $error"); // Log error
      return null;
    }
  }

  static Future<http.Response> sendData(UserSignupReq userSignup) async {
    final response = await http.post(
      Uri.parse("${Utils.baseUrl}/userSignup"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userSignup.toJson()),
    );

    return response;
  }
}
