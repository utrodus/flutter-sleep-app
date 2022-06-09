import 'package:shared_preferences/shared_preferences.dart';

class PrefsData {
  static saveData(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  static getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
