/// String extension methods
extension StringExtension on String {
  /// Check if string is empty or whitespace
  bool get isBlank => trim().isEmpty;

  /// Check if string is not empty or whitespace
  bool get isNotBlank => !isBlank;

  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalize first letter of each word
  String get capitalizeWords {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Remove all whitespace
  String get removeAllWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Truncate string to specified length
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return substring(0, length) + suffix;
  }

  /// Check if string is a valid email
  bool get isEmail => RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(this);

  /// Check if string is a valid URL
  bool get isUrl => RegExp(
    r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$',
  ).hasMatch(this);

  /// Check if string is a valid phone number
  bool get isPhoneNumber => RegExp(r'^\+?[0-9]{10,20}$').hasMatch(this);

  /// Convert to int
  int? toIntOrNull() => int.tryParse(this);

  /// Convert to double
  double? toDoubleOrNull() => double.tryParse(this);

  /// Convert to num
  num? toNumOrNull() => num.tryParse(this);

  /// Remove special characters
  String get removeSpecialCharacters => replaceAll(RegExp(r'[^\w\s]'), '');

  /// Reverse string
  String get reversed => split('').reversed.join();
}
