import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late final SharedPreferences _storage;
  static Future init() async {
    _storage = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _storage.setBool(key, value);
  }

  static bool getBool(String key) {
    return _storage.getBool(key) ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    return await _storage.setString(key, value);
  }

  static String getString(String key) {
    return _storage.getString(key) ?? "";
  }

  static Future<bool> remove(String key) async {
    return await _storage.remove(key);
  }
}
