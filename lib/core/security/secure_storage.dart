import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/storage_keys.dart';

/// Secure storage wrapper for sensitive data
class SecureStorageWrapper {
  final FlutterSecureStorage _storage;

  SecureStorageWrapper()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
          iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock,
          ),
        );

  /// Read value from secure storage
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      return null;
    }
  }

  /// Write value to secure storage
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      // Handle error
    }
  }

  /// Delete value from secure storage
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      // Handle error
    }
  }

  /// Clear all values from secure storage
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      // Handle error
    }
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      return false;
    }
  }

  /// Read all keys
  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      return {};
    }
  }
}
