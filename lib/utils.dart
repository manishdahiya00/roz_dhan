import 'package:advertising_id/advertising_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Utils {
  static const baseUrl = "http://192.168.81.141:3000/api/v1/";

  static Future<Map<String, String>> getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName;
    String versionCode;

    versionName = packageInfo.version;
    versionCode = packageInfo.buildNumber;

    return {
      "versionName": versionName,
      "versionCode": versionCode,
    };
  }

  static Future<Map<String, String>> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;

    String deviceId = "";
    String deviceType = "";
    String deviceName = "";

    deviceId = deviceInfo.model;
    deviceType = "Android";
    deviceName = deviceInfo.manufacturer;

    return {
      "deviceId": deviceId,
      "deviceType": deviceType,
      "deviceName": deviceName,
    };
  }

  static Future<String> getAdvertisingId() async {
    try {
      return await AdvertisingId.id(true) ?? '';
    } catch (error) {
      return '';
    }
  }
}
