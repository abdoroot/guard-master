import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

class CacheHelper {
  static GetStorage _box = GetStorage();
  static FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static dynamic getData({required String key}) {
    return _box.read(key);
  }

  static saveData({required String key, required dynamic value}) async {
    return await _box.write(key, value);
  }

  static Future<void> clearData(String key) async {
    return await _box.remove(key);
  }

  static saveSecure({required String key, required dynamic value}) {
    return _secureStorage.write(key: key, value: value);
  }

  static getSecure({required String key}) {
    return _secureStorage.read(key: key);
  }

  static clearSecure({required String key}) {
    return _secureStorage.read(key: key);
  }
}

class KeyStorage {
  static String get user => "User";
  static String get accountType => "Account Type";
  static String get typeTechnical => "Technical";
  static String get typeAdmin => "Admin";
  static String get badgerCounter => "badgerCounter";
  static String get badgerCounterTechnical => "badgerCounterTechnical";
}
