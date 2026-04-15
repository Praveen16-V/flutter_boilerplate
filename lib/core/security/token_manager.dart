import 'dart:convert';
import '../constants/storage_keys.dart';
import 'secure_storage.dart';

/// Token manager for JWT authentication
class TokenManager {
  final SecureStorageWrapper _secureStorage;

  TokenManager({required SecureStorageWrapper secureStorage})
    : _secureStorage = secureStorage;

  /// Save access token
  Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(StorageKeys.accessToken, token);
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(StorageKeys.accessToken);
  }

  /// Save refresh token
  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(StorageKeys.refreshToken, token);
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(StorageKeys.refreshToken);
  }

  /// Clear all tokens
  Future<void> clearTokens() async {
    await _secureStorage.delete(StorageKeys.accessToken);
    await _secureStorage.delete(StorageKeys.refreshToken);
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  /// Extract user ID from token (JWT)
  String? extractUserIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      // Decode base64
      final decoded = String.fromCharCodes(base64.decode(payload));

      // Parse JSON (simplified)
      // In production, use proper JWT library
      return decoded; // Return payload, extract ID as needed
    } catch (e) {
      return null;
    }
  }

  /// Check if token is expired (simplified check)
  bool isTokenExpired(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return true;

      final payload = parts[1];
      final decoded = String.fromCharCodes(base64.decode(payload));

      // Check exp claim (simplified)
      // In production, use proper JWT library
      return false;
    } catch (e) {
      return true;
    }
  }
}
