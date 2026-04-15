import 'package:flutter/material.dart';
import '../../../app/themes/app_colors.dart';

/// App snackbar utilities
class AppSnackbar {
  /// Show success snackbar
  static void showSuccess(
    BuildContext context,
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show error snackbar
  static void showError(
    BuildContext context,
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show warning snackbar
  static void showWarning(
    BuildContext context,
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.warning,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show info snackbar
  static void showInfo(
    BuildContext context,
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.info,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: action,
      ),
    );
  }

  /// Dismiss current snackbar
  static void dismiss(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
