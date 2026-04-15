import 'package:flutter/foundation.dart';

/// Environment configuration reader
class Env {
  /// Get value from --dart-define
  static String get(String key, {String defaultValue = ''}) {
    return String.fromEnvironment(key, defaultValue: defaultValue);
  }

  /// Get boolean value from --dart-define
  static bool getBool(String key, {bool defaultValue = false}) {
    return bool.fromEnvironment(key, defaultValue: defaultValue);
  }

  /// Get integer value from --dart-define
  static int getInt(String key, {int defaultValue = 0}) {
    return int.fromEnvironment(key, defaultValue: defaultValue);
  }

  /// Check if running in debug mode
  static bool get isDebug => kDebugMode;

  /// Check if running in profile mode
  static bool get isProfile => kProfileMode;

  /// Check if running in release mode
  static bool get isRelease => kReleaseMode;
}
