import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //? store a string
  void setString({required String key, required String stringToStore}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, stringToStore);
  }

  //? retrieve stored string
  Future<String?> getString({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(key);
    return token;
  }

  //? store an int
  void setInt({required String key, required int intToStore}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, intToStore);
  }

  //? retrieve stored int
  Future<int?> getInt({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? token = preferences.getInt(key);
    return token;
  }

  //? store a double
  void setDouble({required String key, required double doubleToStore}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble(key, doubleToStore);
  }

  //? retrieve stored double
  Future<double?> getDouble({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double? token = preferences.getDouble(key);
    return token;
  }

  //? store a bool
  void setBool({required String key, required bool boolToStore}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, boolToStore);
  }

  //? retrieve stored bool
  Future<bool?> getBool({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? token = preferences.getBool(key);
    return token;
  }
}
