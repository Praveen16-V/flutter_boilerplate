import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/home_data.dart';

/// Home repository interface
abstract class HomeRepository {
  /// Get home data
  Future<Either<Failure, HomeData>> getHomeData();
}
