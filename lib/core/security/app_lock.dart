import '../constants/app_constants.dart';
import '../constants/storage_keys.dart';
import '../storage/local_storage.dart';

/// App lock functionality for security
class AppLock {
  final LocalStorage _localStorage;

  AppLock({required LocalStorage localStorage}) : _localStorage = localStorage;

  /// Get auto-lock timeout in minutes
  Future<int> get lockTimeout async {
    final timeout = await _localStorage.getInt(StorageKeys.autoLockTimeout);
    return timeout ?? AppConstants.sessionTimeoutMinutes;
  }

  /// Set auto-lock timeout
  Future<void> setLockTimeout(int minutes) async {
    await _localStorage.setInt(StorageKeys.autoLockTimeout, minutes);
  }

  /// Check if app should be locked
  Future<bool> shouldLock() async {
    final lastActive = await getLastActiveTime();
    if (lastActive == null) return false;

    final now = DateTime.now();
    final difference = now.difference(lastActive).inMinutes;
    final timeout = await lockTimeout;

    return difference >= timeout;
  }

  /// Update last active time
  Future<void> updateLastActiveTime() async {
    await _localStorage.setString(
      StorageKeys.lastLoginDate,
      DateTime.now().toIso8601String(),
    );
  }

  /// Get last active time
  Future<DateTime?> getLastActiveTime() async {
    final lastActiveStr = await _localStorage.getString(
      StorageKeys.lastLoginDate,
    );
    if (lastActiveStr == null) return null;
    return DateTime.tryParse(lastActiveStr);
  }

  /// Increment failed attempts
  Future<int> incrementFailedAttempts() async {
    final attempts = await getFailedAttempts();
    final newAttempts = attempts + 1;
    await _localStorage.setInt(StorageKeys.failedAttempts, newAttempts);
    return newAttempts;
  }

  /// Get failed attempts
  Future<int> getFailedAttempts() async {
    return await _localStorage.getInt(StorageKeys.failedAttempts) ?? 0;
  }

  /// Reset failed attempts
  Future<void> resetFailedAttempts() async {
    await _localStorage.setInt(StorageKeys.failedAttempts, 0);
  }

  /// Check if device should be locked due to too many failed attempts
  Future<bool> isLockedDueToFailedAttempts() async {
    final attempts = await getFailedAttempts();
    return attempts >= AppConstants.maxLoginAttempts;
  }

  /// Set lock until time
  Future<void> setLockUntil(DateTime dateTime) async {
    await _localStorage.setString(
      StorageKeys.lockUntil,
      dateTime.toIso8601String(),
    );
  }

  /// Get lock until time
  Future<DateTime?> getLockUntil() async {
    final lockUntilStr = await _localStorage.getString(StorageKeys.lockUntil);
    if (lockUntilStr == null) return null;
    return DateTime.tryParse(lockUntilStr);
  }

  /// Check if device is currently locked
  Future<bool> isLocked() async {
    final lockUntil = await getLockUntil();
    if (lockUntil == null) return false;
    return DateTime.now().isBefore(lockUntil);
  }

  /// Clear lock
  Future<void> clearLock() async {
    await _localStorage.delete(StorageKeys.lockUntil);
    await resetFailedAttempts();
  }
}
