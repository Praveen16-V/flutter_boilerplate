import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Logging interceptor for API requests and responses (debug only)
class LoggingInterceptor extends PrettyDioLogger {
  LoggingInterceptor()
    : super(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
}
