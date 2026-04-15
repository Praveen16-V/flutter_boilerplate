/// Application configuration that reads from --dart-define
class AppConfig {
  /// Base URL for API endpoints
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api.example.com',
  );

  /// API key for authentication
  static const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: '',
  );

  /// Environment: dev, staging, or prod
  static const env = String.fromEnvironment(
    'ENV',
    defaultValue: 'dev',
  );

  /// Request timeout in seconds
  static const timeout = int.fromEnvironment(
    'TIMEOUT',
    defaultValue: 30,
  );

  /// Enable analytics tracking
  static const enableAnalytics = bool.fromEnvironment(
    'ANALYTICS',
    defaultValue: false,
  );

  /// Sentry DSN for error tracking
  static const sentryDsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );

  /// Check if running in development environment
  static bool get isDev => env == 'dev';

  /// Check if running in staging environment
  static bool get isStaging => env == 'staging';

  /// Check if running in production environment
  static bool get isProd => env == 'prod';

  /// Check if analytics is enabled
  static bool get analyticsEnabled => enableAnalytics;

  /// Get timeout duration in milliseconds
  static Duration get timeoutDuration => Duration(seconds: timeout);
}
