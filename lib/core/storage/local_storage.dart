import 'package:shared_preferences/shared_preferences.dart';
import '../constants/storage_keys.dart';

/// Local storage wrapper using SharedPreferences
class LocalStorage {
  SharedPreferences? _prefs;

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Ensure SharedPreferences is initialized
  Future<SharedPreferences> get _instance async {
    if (_prefs == null) {
      await init();
    }
    return _prefs!;
  }

  /// Read string value
  Future<String?> getString(String key) async {
    final prefs = await _instance;
    return prefs.getString(key);
  }

  /// Write string value
  Future<void> setString(String key, String value) async {
    final prefs = await _instance;
    await prefs.setString(key, value);
  }

  /// Read integer value
  Future<int?> getInt(String key) async {
    final prefs = await _instance;
    return prefs.getInt(key);
  }

  /// Write integer value
  Future<void> setInt(String key, int value) async {
    final prefs = await _instance;
    await prefs.setInt(key, value);
  }

  /// Read boolean value
  Future<bool?> getBool(String key) async {
    final prefs = await _instance;
    return prefs.getBool(key);
  }

  /// Write boolean value
  Future<void> setBool(String key, bool value) async {
    final prefs = await _instance;
    await prefs.setBool(key, value);
  }

  /// Read double value
  Future<double?> getDouble(String key) async {
    final prefs = await _instance;
    return prefs.getDouble(key);
  }

  /// Write double value
  Future<void> setDouble(String key, double value) async {
    final prefs = await _instance;
    await prefs.setDouble(key, value);
  }

  /// Read string list
  Future<List<String>?> getStringList(String key) async {
    final prefs = await _instance;
    return prefs.getStringList(key);
  }

  /// Write string list
  Future<void> setStringList(String key, List<String> value) async {
    final prefs = await _instance;
    await prefs.setStringList(key, value);
  }

  /// Delete value
  Future<void> delete(String key) async {
    final prefs = await _instance;
    await prefs.remove(key);
  }

  /// Clear all values
  Future<void> clear() async {
    final prefs = await _instance;
    await prefs.clear();
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    final prefs = await _instance;
    return prefs.containsKey(key);
  }

  /// Get all keys
  Future<Set<String>> getKeys() async {
    final prefs = await _instance;
    return prefs.getKeys();
  }

  /// Reload preferences
  Future<void> reload() async {
    final prefs = await _instance;
    await prefs.reload();
  }
}
