/// Base class for all exceptions
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => message;
}

/// Server exception - 5xx errors
class ServerException extends AppException {
  ServerException({
    String message = 'Server error occurred',
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

/// Network exception - no internet connection
class NetworkException extends AppException {
  NetworkException({
    String message = 'No internet connection',
  }) : super(message: message);
}

/// Cache exception - local storage error
class CacheException extends AppException {
  CacheException({
    String message = 'Cache error occurred',
  }) : super(message: message);
}

/// Unauthorized exception - 401 error
class UnauthorizedException extends AppException {
  UnauthorizedException({
    String message = 'Unauthorized access',
  }) : super(message: message, statusCode: 401);
}

/// Forbidden exception - 403 error
class ForbiddenException extends AppException {
  ForbiddenException({
    String message = 'Access forbidden',
  }) : super(message: message, statusCode: 403);
}

/// Not found exception - 404 error
class NotFoundException extends AppException {
  NotFoundException({
    String message = 'Resource not found',
  }) : super(message: message, statusCode: 404);
}

/// Validation exception - 400 error
class ValidationException extends AppException {
  final Map<String, dynamic>? errors;

  ValidationException({
    String message = 'Validation error',
    this.errors,
    int? statusCode,
  }) : super(message: message, statusCode: statusCode ?? 400);
}

/// Timeout exception
class TimeoutException extends AppException {
  TimeoutException({
    String message = 'Request timeout',
  }) : super(message: message);
}

/// Unknown exception - catch-all for unexpected errors
class UnknownException extends AppException {
  UnknownException({
    String message = 'An unknown error occurred',
  }) : super(message: message);
}

/// Authentication exception
class AuthenticationException extends AppException {
  AuthenticationException({
    String message = 'Authentication failed',
  }) : super(message: message);
}

/// Permission exception
class PermissionException extends AppException {
  PermissionException({
    String message = 'Permission denied',
  }) : super(message: message);
}
