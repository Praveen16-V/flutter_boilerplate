import '../config/app_config.dart';

/// API constants and endpoints
class ApiConstants {
  // Base URLs
  static const String baseUrl = AppConfig.baseUrl;
  
  // API version
  static const String apiVersion = '/v1';
  
  // Timeouts (in milliseconds)
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
  
  // Headers
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String authorizationHeader = 'Authorization';
  static const String bearerPrefix = 'Bearer ';
  
  // Endpoints
  static const String authPath = '/auth';
  static const String loginPath = '$authPath/login';
  static const String logoutPath = '$authPath/logout';
  static const String refreshTokenPath = '$authPath/refresh';
  static const String registerPath = '$authPath/register';
  static const String forgotPasswordPath = '$authPath/forgot-password';
  static const String resetPasswordPath = '$authPath/reset-password';
  
  static const String usersPath = '/users';
  static const String userProfilePath = '$usersPath/profile';
  static const String userSettingsPath = '$usersPath/settings';
  
  static const String homePath = '/home';
  static const String dashboardPath = '$homePath/dashboard';
  static const String quickActionsPath = '$homePath/quick-actions';
  static const String recentActivitiesPath = '$homePath/recent-activities';
  
  // Query parameters
  static const String pageParam = 'page';
  static const String limitParam = 'limit';
  static const String searchParam = 'search';
  static const String sortParam = 'sort';
  static const String filterParam = 'filter';
  
  // Default values
  static const int defaultPage = 1;
  static const int defaultLimit = 20;
  static const int maxLimit = 100;
  
  // Retry configuration
  static const int maxRetries = 3;
  static const int retryDelayMs = 1000;
}
