import 'dart:convert';
import 'package:http/http.dart' as http;

class UserSignup {
  static Future<http.Response> sendUserData({
    required String deviceId,
    required String deviceType,
    required String deviceName,
    required String socialName,
    required String socialEmail,
    required String socialImgurl,
    required String versionName,
    required String versionCode,
    required String apiUrl,
  }) async {
    Map<String, dynamic> userData = {};

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userData),
    );

    return response;
  }
}
