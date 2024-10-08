import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  SharedPreferences? _preferences;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUid(String uid) async {
    await _preferences?.setString('uid', uid);
  }

  Future<String?> getUid() async {
    return _preferences?.getString('uid');
  }

  Future<void> clearUid() async {
    await _preferences?.remove('uid');
  }

  Future<void> clearAll() async {
    await _preferences?.clear();
  }
}
