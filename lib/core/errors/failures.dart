import 'package:equatable/equatable.dart';

/// Base class for all failures
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

/// Server failure - 5xx errors
class ServerFailure extends Failure {
  const ServerFailure({
    String message = 'Server error occurred',
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

/// Network failure - no internet connection
class NetworkFailure extends Failure {
  const NetworkFailure({
    String message = 'No internet connection',
  }) : super(message: message);
}

/// Cache failure - local storage error
class CacheFailure extends Failure {
  const CacheFailure({
    String message = 'Cache error occurred',
  }) : super(message: message);
}

/// Unauthorized failure - 401 error
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    String message = 'Unauthorized access',
  }) : super(message: message, statusCode: 401);
}

/// Forbidden failure - 403 error
class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    String message = 'Access forbidden',
  }) : super(message: message, statusCode: 403);
}

/// Not found failure - 404 error
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    String message = 'Resource not found',
  }) : super(message: message, statusCode: 404);
}

/// Validation failure - 400 error
class ValidationFailure extends Failure {
  final Map<String, dynamic>? errors;

  const ValidationFailure({
    String message = 'Validation error',
    this.errors,
    int? statusCode,
  }) : super(message: message, statusCode: statusCode ?? 400);

  @override
  List<Object?> get props => [message, statusCode, errors];
}

/// Timeout failure
class TimeoutFailure extends Failure {
  const TimeoutFailure({
    String message = 'Request timeout',
  }) : super(message: message);
}

/// Unknown failure - catch-all for unexpected errors
class UnknownFailure extends Failure {
  const UnknownFailure({
    String message = 'An unknown error occurred',
  }) : super(message: message);
}

/// Authentication failure
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    String message = 'Authentication failed',
  }) : super(message: message);
}

/// Permission failure
class PermissionFailure extends Failure {
  const PermissionFailure({
    String message = 'Permission denied',
  }) : super(message: message);
}
