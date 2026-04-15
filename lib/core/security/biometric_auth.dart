import 'dart:io';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

/// Biometric authentication handler
class BiometricAuth {
  final LocalAuthentication _localAuth;

  BiometricAuth() : _localAuth = LocalAuthentication();

  /// Check if device supports biometric authentication
  Future<bool> get isDeviceSupported async {
    try {
      return await _localAuth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  /// Check if biometric authentication is available
  Future<bool> get canCheckBiometrics async {
    try {
      return await _localAuth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  /// Get available biometric types
  Future<List<BiometricType>> get availableBiometrics async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  /// Authenticate with biometrics
  Future<bool> authenticate({
    String localizedReason = 'Authenticate to access',
    bool stickyAuth = false,
    bool biometricOnly = false,
  }) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: localizedReason,
        options: AuthenticationOptions(
          stickyAuth: stickyAuth,
          biometricOnly: biometricOnly,
        ),
      );
    } on PlatformException catch (e) {
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Check if device has fingerprint sensor
  Future<bool> get hasFingerprint async {
    final biometrics = await availableBiometrics;
    return biometrics.contains(BiometricType.fingerprint);
  }

  /// Check if device has face recognition
  Future<bool> get hasFace async {
    final biometrics = await availableBiometrics;
    return biometrics.contains(BiometricType.face) ||
        biometrics.contains(BiometricType.iris);
  }

  /// Stop authentication
  Future<void> stopAuthentication() async {
    try {
      await _localAuth.stopAuthentication();
    } catch (e) {
      // Handle error
    }
  }
}
