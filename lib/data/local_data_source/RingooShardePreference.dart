import 'package:shared_preferences/shared_preferences.dart';

class RingooSharedPreference {
  static SharedPreferences? pref;

  static Future<void> init() async {
    pref ??= await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, dynamic value) async {
    if (pref == null) await init();
    switch (value.runtimeType) {
      case String:
        return await pref!.setString(key, value);
      case int:
        return await pref!.setInt(key, value);
      case double:
        return await pref!.setDouble(key, value);
      case bool:
        return await pref!.setBool(key, value);
      default:
        return await pref!.setString(key, value);
    }
  }

  static Future<dynamic> getData(String key) async {
    return pref!.get(key);
  }

}
