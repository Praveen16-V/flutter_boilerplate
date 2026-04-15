import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart' as smart_retry;

/// Retry interceptor for handling failed requests with exponential backoff
class AppRetryInterceptor extends Interceptor {
  final smart_retry.RetryInterceptor _retryInterceptor;

  AppRetryInterceptor({
    required Dio dio,
    required int retries,
    required List<Duration> retryDelays,
  }) : _retryInterceptor = smart_retry.RetryInterceptor(
         dio: dio,
         retries: retries,
         retryDelays: retryDelays,
         retryableExtraStatuses: {
           408, // Request Timeout
           429, // Too Many Requests
           500, // Internal Server Error
           502, // Bad Gateway
           503, // Service Unavailable
           504, // Gateway Timeout
         },
       );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _retryInterceptor.onError(err, handler);
  }
}
