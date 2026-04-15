import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

/// Date and time utilities
class AppDateUtils {
  /// Format date to display format
  static String formatDisplayDate(DateTime date) {
    return DateFormat(AppConstants.displayDateFormat).format(date);
  }

  /// Format date and time to display format
  static String formatDisplayDateTime(DateTime dateTime) {
    return DateFormat(AppConstants.displayDateTimeFormat).format(dateTime);
  }

  /// Format date to standard format
  static String formatDate(DateTime date) {
    return DateFormat(AppConstants.dateFormat).format(date);
  }

  /// Format time to standard format
  static String formatTime(DateTime time) {
    return DateFormat(AppConstants.timeFormat).format(time);
  }

  /// Parse date from string
  static DateTime? parseDate(String dateString) {
    try {
      return DateFormat(AppConstants.dateFormat).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Parse date time from string
  static DateTime? parseDateTime(String dateTimeString) {
    try {
      return DateFormat(AppConstants.dateTimeFormat).parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }

  /// Get time ago string (e.g., "2 hours ago")
  static String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} ${(difference.inDays / 7).floor() == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} ${(difference.inDays / 30).floor() == 1 ? 'month' : 'months'} ago';
    } else {
      return '${(difference.inDays / 365).floor()} ${(difference.inDays / 365).floor() == 1 ? 'year' : 'years'} ago';
    }
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Get start of day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Get end of day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  /// Get start of week
  static DateTime startOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  /// Get end of week
  static DateTime endOfWeek(DateTime date) {
    return date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
  }

  /// Get start of month
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Get end of month
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59, 999);
  }

  /// Get age from birth date
  static int getAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Check if date is in the future
  static bool isFuture(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  /// Check if date is in the past
  static bool isPast(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  /// Add days to date
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  /// Subtract days from date
  static DateTime subtractDays(DateTime date, int days) {
    return date.subtract(Duration(days: days));
  }

  /// Get days between two dates
  static int daysBetween(DateTime from, DateTime to) {
    return (to.difference(from).inHours / 24).round();
  }
}
