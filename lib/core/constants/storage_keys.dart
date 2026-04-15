/// Storage keys for SharedPreferences and SecureStorage
class StorageKeys {
  // Authentication keys (Secure Storage)
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userPassword = 'user_password';
  
  // User preferences (SharedPreferences)
  static const String isFirstLaunch = 'is_first_launch';
  static const String isLoggedIn = 'is_logged_in';
  static const String themeMode = 'theme_mode';
  static const String languageCode = 'language_code';
  static const String countryCode = 'country_code';
  
  // App settings (SharedPreferences)
  static const String enableNotifications = 'enable_notifications';
  static const String enableAnalytics = 'enable_analytics';
  static const String enableBiometric = 'enable_biometric';
  static const String autoLockTimeout = 'auto_lock_timeout';
  static const String lastLoginDate = 'last_login_date';
  
  // Cache keys (SharedPreferences)
  static const String cacheVersion = 'cache_version';
  static const String lastSyncTimestamp = 'last_sync_timestamp';
  
  // Onboarding
  static const String onboardingCompleted = 'onboarding_completed';
  static const String onboardingStep = 'onboarding_step';
  
  // Security
  static const String pinCode = 'pin_code';
  static const String failedAttempts = 'failed_attempts';
  static const String lockUntil = 'lock_until';
  
  // Feature flags
  static const String featureFlagHome = 'feature_flag_home';
  static const String featureFlagProfile = 'feature_flag_profile';
  static const String featureFlagSettings = 'feature_flag_settings';
  
  // Session
  static const String sessionId = 'session_id';
  static const String sessionExpiry = 'session_expiry';
  
  // Device info
  static const String deviceId = 'device_id';
  static const String deviceToken = 'device_token';
}
