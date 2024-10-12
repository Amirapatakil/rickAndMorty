import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  void save({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> read({required String key, String? value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString(key) ?? '';
    return value;
  }
}

abstract class PrefsKeys {
  static const String user = 'user_key';
  static const String lastname = 'lastname_key';
  static const String fathername = 'fathername_key';
  static const String login = 'login_key';
}

class FilterStorage {
  static Future<void> saveFilters(
      {required bool isAliveChecked,
      required bool isDeadChecked,
      required bool isUnknownChecked,
      required bool isSortAZ,
      required bool isFemale,
      required bool isMale,
      required bool isNone}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAliveChecked', isAliveChecked);
    await prefs.setBool('isDeadChecked', isDeadChecked);
    await prefs.setBool('isUnknownChecked', isUnknownChecked);
    await prefs.setBool('isSortAZ', isSortAZ);
    await prefs.setBool('isFemale', isFemale);
    await prefs.setBool('isMale', isMale);
    await prefs.setBool('isNone', isNone);
  }

  static Future<Map<String, bool>> loadFilters() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'isAliveChecked': prefs.getBool('isAliveChecked') ?? false,
      'isDeadChecked': prefs.getBool('isDeadChecked') ?? false,
      'isUnknownChecked': prefs.getBool('isUnknownChecked') ?? false,
      'isSortAZ': prefs.getBool('isSortAZ') ?? false,
      'isFemale': prefs.getBool('isFemale') ?? false,
      'isMale': prefs.getBool('isMale') ?? false,
      'isNone': prefs.getBool('isNone') ?? false,
    };
  }

  static Future<void> resetFilters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAliveChecked');
    await prefs.remove('isDeadChecked');
    await prefs.remove('isUnknownChecked');
    await prefs.remove('isSortAZ');
    await prefs.remove('isFemale');
    await prefs.remove('isMale');
    await prefs.remove('isNone');
  }
}
