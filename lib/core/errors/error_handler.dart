import 'dart:io';
import 'package:dio/dio.dart';
import '../utils/logger.dart';
import 'exceptions.dart';
import 'failures.dart';

/// Global error handler for converting exceptions to failures
class ErrorHandler {
  final AppLogger _logger = AppLogger();

  /// Handle error and return appropriate Failure
  Failure handleError(dynamic error) {
    _logger.error('Error occurred: $error');

    if (error is Failure) {
      return error;
    }

    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is SocketException) {
      return const NetworkFailure(message: 'No internet connection');
    }

    if (error is HttpException) {
      return ServerFailure(
        message: error.message,
        statusCode: _getStatusCode(error.message),
      );
    }

    if (error is FormatException) {
      return const ValidationFailure(message: 'Invalid data format');
    }

    return const UnknownFailure(message: 'An unexpected error occurred');
  }

  /// Handle Dio-specific errors
  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure(message: 'Connection timeout');

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode, error);

      case DioExceptionType.cancel:
        return const UnknownFailure(message: 'Request cancelled');

      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');

      case DioExceptionType.badCertificate:
        return const ServerFailure(message: 'Invalid SSL certificate');

      case DioExceptionType.unknown:
        return _handleUnknownError(error.error);
    }
  }

  /// Handle HTTP status codes
  Failure _handleStatusCode(int? statusCode, DioException error) {
    final message = error.response?.data?['message'] ?? 'Request failed';

    switch (statusCode) {
      case 400:
        return ValidationFailure(
          message: message,
          errors: error.response?.data?['errors'],
        );
      case 401:
        return const UnauthorizedFailure();
      case 403:
        return const ForbiddenFailure();
      case 404:
        return const NotFoundFailure();
      case 500:
      case 502:
      case 503:
      case 504:
        return ServerFailure(message: message, statusCode: statusCode);
      default:
        return ServerFailure(
          message: message,
          statusCode: statusCode,
        );
    }
  }

  /// Handle unknown errors
  Failure _handleUnknownError(dynamic error) {
    if (error is SocketException) {
      return const NetworkFailure(message: 'No internet connection');
    }

    return UnknownFailure(message: error.toString());
  }

  /// Extract status code from error message
  int? _getStatusCode(String message) {
    final regex = RegExp(r'(\d{3})');
    final match = regex.firstMatch(message);
    return match != null ? int.tryParse(match.group(1)!) : null;
  }
}
