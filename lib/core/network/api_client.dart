import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../constants/api_constants.dart';
import '../security/secure_storage.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

/// API client wrapper for Dio with all interceptors configured
class ApiClient {
  late final Dio _dio;

  /// Get the Dio instance
  Dio get dio => _dio;

  ApiClient({required SecureStorageWrapper secureStorage}) {
    _dio = Dio(_createBaseOptions());
    _setupInterceptors(secureStorage);
  }

  /// Create base Dio options
  BaseOptions _createBaseOptions() {
    return BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
      sendTimeout: Duration(milliseconds: ApiConstants.sendTimeout),
      headers: {
        ApiConstants.contentType: ApiConstants.contentType,
        ApiConstants.accept: ApiConstants.accept,
      },
    );
  }

  /// Setup all interceptors
  void _setupInterceptors(SecureStorageWrapper secureStorage) {
    // Add retry interceptor
    _dio.interceptors.add(
      AppRetryInterceptor(
        dio: _dio,
        retries: ApiConstants.maxRetries,
        retryDelays: List.generate(
          ApiConstants.maxRetries,
          (index) =>
              Duration(milliseconds: ApiConstants.retryDelayMs * (index + 1)),
        ),
      ),
    );

    // Add auth interceptor
    _dio.interceptors.add(AuthInterceptor(secureStorage: secureStorage));

    // Add logging interceptor (only in debug mode)
    if (AppConfig.isDev) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
