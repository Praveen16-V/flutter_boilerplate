import 'package:dio/dio.dart';
import '../../constants/api_constants.dart';
import '../../constants/storage_keys.dart';
import '../../security/secure_storage.dart';

/// Interceptor to automatically add authentication token to requests
class AuthInterceptor extends Interceptor {
  final SecureStorageWrapper _secureStorage;

  AuthInterceptor({required SecureStorageWrapper secureStorage})
    : _secureStorage = secureStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add auth token if available
    final token = await _secureStorage.read(StorageKeys.accessToken);
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorizationHeader] =
          '${ApiConstants.bearerPrefix}$token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 errors - token expired
    if (err.response?.statusCode == 401) {
      // Try to refresh token
      final refreshToken = await _secureStorage.read(StorageKeys.refreshToken);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          // Attempt token refresh
          // This would call a refresh endpoint - implement as needed
          // For now, we'll just clear the tokens and proceed
          await _secureStorage.delete(StorageKeys.accessToken);
          await _secureStorage.delete(StorageKeys.refreshToken);
        } catch (e) {
          // If refresh fails, clear tokens
          await _secureStorage.delete(StorageKeys.accessToken);
          await _secureStorage.delete(StorageKeys.refreshToken);
        }
      }
    }

    handler.next(err);
  }
}
