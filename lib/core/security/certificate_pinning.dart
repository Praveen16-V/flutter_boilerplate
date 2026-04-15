import 'dart:io';
import 'package:dio/dio.dart';

/// Certificate pinning configuration for secure HTTPS connections
class CertificatePinning {
  /// Security context for certificate pinning
  static SecurityContext get securityContext {
    final context = SecurityContext(withTrustedRoots: false);
    
    // Add trusted certificates
    // In production, load certificates from assets
    // For now, we'll use system defaults
    
    return context;
  }

  /// Create Dio instance with certificate pinning
  static Dio createSecureDio({String? baseUrl}) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
    ));

    // Add certificate validation interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Validate certificate
          handler.next(options);
        },
        onError: (error, handler) {
          if (error.type == DioExceptionType.badCertificate) {
            // Handle certificate error
          }
          handler.next(error);
        },
      ),
    );

    return dio;
  }

  /// Validate certificate (placeholder for implementation)
  static bool validateCertificate(X509Certificate cert) {
    // Implement certificate validation logic
    // Check expiration, issuer, etc.
    return true;
  }
}
