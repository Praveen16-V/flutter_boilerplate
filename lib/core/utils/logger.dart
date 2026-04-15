import 'package:flutter/foundation.dart';
import '../config/env.dart';

/// Structured logger for the application
class AppLogger {
  /// Log debug message (only in debug mode)
  void debug(String message, {Object? error, StackTrace? stackTrace}) {
    if (Env.isDebug) {
      debugPrint('[DEBUG] $message');
      if (error != null) {
        debugPrint('Error: $error');
      }
      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }
    }
  }

  /// Log info message
  void info(String message) {
    if (kDebugMode) {
      debugPrint('[INFO] $message');
    }
  }

  /// Log warning message
  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      debugPrint('[WARNING] $message');
      if (error != null) {
        debugPrint('Error: $error');
      }
      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }
    }
  }

  /// Log error message
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      debugPrint('[ERROR] $message');
      if (error != null) {
        debugPrint('Error: $error');
      }
      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }
    }
  }

  /// Log verbose message (only in debug mode)
  void verbose(String message) {
    if (Env.isDebug) {
      debugPrint('[VERBOSE] $message');
    }
  }

  /// Log wtf (What a Terrible Failure) message
  void wtf(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      debugPrint('[WTF] $message');
      if (error != null) {
        debugPrint('Error: $error');
      }
      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }
    }
  }
}
