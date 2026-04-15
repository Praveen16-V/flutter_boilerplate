import '../constants/app_constants.dart';

/// Form validation helpers
class Validators {
  /// Validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(AppConstants.emailPattern).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    if (value.length > AppConstants.maxEmailLength) {
      return 'Email is too long';
    }
    return null;
  }

  /// Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < AppConstants.minPasswordLength) {
      return 'Password must be at least ${AppConstants.minPasswordLength} characters';
    }
    if (value.length > AppConstants.maxPasswordLength) {
      return 'Password is too long';
    }
    if (!RegExp(AppConstants.passwordPattern).hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number, and special character';
    }
    return null;
  }

  /// Validate phone number
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(AppConstants.phonePattern).hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    if (value.length > AppConstants.maxPhoneNumberLength) {
      return 'Phone number is too long';
    }
    return null;
  }

  /// Validate name
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length > AppConstants.maxUserNameLength) {
      return 'Name is too long';
    }
    if (value.length < 2) {
      return 'Name is too short';
    }
    return null;
  }

  /// Validate required field
  static String? validateRequired(String? value, [String fieldName = 'This field']) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validate URL
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    if (!RegExp(AppConstants.urlPattern).hasMatch(value)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  /// Confirm password
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validate pin code
  static String? validatePinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'PIN is required';
    }
    if (value.length != AppConstants.pinCodeLength) {
      return 'PIN must be ${AppConstants.pinCodeLength} digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'PIN must contain only digits';
    }
    return null;
  }
}
