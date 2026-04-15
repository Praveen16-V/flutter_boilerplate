import 'dart:convert';

/// DateTime extension methods
extension DateTimeExtension on DateTime {
  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Get start of day
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get end of day
  DateTime get endOfDay =>
      DateTime(year, month, day, 23, 59, 59, 999);

  /// Get start of week (Monday)
  DateTime get startOfWeek =>
      subtract(Duration(days: weekday - DateTime.monday));

  /// Get end of week (Sunday)
  DateTime get endOfWeek =>
      add(Duration(days: DateTime.sunday - weekday));

  /// Get start of month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Get end of month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  /// Check if date is in the future
  bool get isFuture => isAfter(DateTime.now());

  /// Check if date is in the past
  bool get isPast => isBefore(DateTime.now());

  /// Add days
  DateTime addDays(int days) => add(Duration(days: days));

  /// Subtract days
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  /// Get difference in days
  int differenceInDays(DateTime other) {
    return (difference(other).inHours / 24).round();
  }

  /// Get age from birth date
  int get age {
    final now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }

  /// Format to ISO 8601 string
  String toIso8601String() => toIso8601String();

  /// Format to readable string
  String toReadableString() =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

  /// Format to time string
  String toTimeString() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
