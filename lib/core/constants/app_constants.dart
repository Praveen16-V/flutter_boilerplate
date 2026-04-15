/// Global application constants
class AppConstants {
  // App info
  static const String appName = 'Flutter Boilerplate';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.example.flutter_boilerplate';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Debounce times (milliseconds)
  static const int searchDebounceMs = 500;
  static const int buttonDebounceMs = 300;
  
  // Animation durations (milliseconds)
  static const int defaultAnimationDuration = 300;
  static const int shortAnimationDuration = 150;
  static const int longAnimationDuration = 500;
  
  // Cache durations (in seconds)
  static const int shortCacheDuration = 300; // 5 minutes
  static const int mediumCacheDuration = 1800; // 30 minutes
  static const int longCacheDuration = 86400; // 24 hours
  
  // Security
  static const int maxLoginAttempts = 5;
  static const int lockoutDurationMinutes = 15;
  static const int sessionTimeoutMinutes = 30;
  static const int pinCodeLength = 4;
  
  // Image quality
  static const int imageQuality = 85;
  static const int maxImageSizeBytes = 5242880; // 5MB
  
  // File size limits
  static const int maxFileSizeBytes = 10485760; // 10MB
  
  // Text limits
  static const int maxUserNameLength = 50;
  static const int maxEmailLength = 100;
  static const int maxPasswordLength = 128;
  static const int minPasswordLength = 8;
  static const int maxPhoneNumberLength = 20;
  static const int maxMessageLength = 500;
  
  // Regex patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^\+?[0-9]{10,20}$';
  static const String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static const String urlPattern =
      r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$';
  
  // Date formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm:ss';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayDateTimeFormat = 'MMM dd, yyyy HH:mm';
  
  // Locale
  static const String defaultLanguage = 'en';
  static const String defaultCountry = 'US';
  
  // Supported locales
  static const List<String> supportedLanguages = ['en', 'es', 'fr', 'de'];
  
  // Deep links
  static const String deepLinkScheme = 'flutterboilerplate';
  static const String deepLinkHost = 'app';
  
  // Social media
  static const int twitterMaxLength = 280;
  static const int instagramCaptionMaxLength = 2200;
}
