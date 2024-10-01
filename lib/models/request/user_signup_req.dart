class UserSignupReq {
  final String deviceId;
  final String deviceType;
  final String deviceName;
  final String socialName;
  final String socialEmail;
  final String socialImgurl;
  final String versionName;
  final String versionCode;
  final String advertisingId;

  UserSignupReq({
    required this.deviceId,
    required this.deviceType,
    required this.deviceName,
    required this.socialName,
    required this.socialEmail,
    required this.socialImgurl,
    required this.versionName,
    required this.versionCode,
    required this.advertisingId,
  });

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'deviceType': deviceType,
      'deviceName': deviceName,
      'socialName': socialName,
      'socialEmail': socialEmail,
      'socialImgurl': socialImgurl,
      'versionName': versionName,
      'versionCode': versionCode,
      'advertisingId': advertisingId,
    };
  }
}
