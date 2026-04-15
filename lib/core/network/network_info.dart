import 'package:dartz/dartz.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Network information checker
abstract class NetworkInfo {
  /// Check if device is connected to internet
  Future<bool> get isConnected;

  /// Check current connectivity status
  Future<Either<String, ConnectivityResult>> get connectivityStatus;
}

/// Implementation of NetworkInfo using connectivity_plus
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl() : _connectivity = Connectivity();

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result.any((r) => r != ConnectivityResult.none);
  }

  @override
  Future<Either<String, ConnectivityResult>> get connectivityStatus async {
    try {
      final result = await _connectivity.checkConnectivity();
      final status = result.firstWhere(
        (r) => r != ConnectivityResult.none,
        orElse: () => ConnectivityResult.none,
      );
      return Right(status);
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Stream of connectivity changes
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
