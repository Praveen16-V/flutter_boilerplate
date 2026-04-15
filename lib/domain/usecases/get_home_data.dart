import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/home_data.dart';
import '../repositories/home_repository.dart';

/// Get home data use case
class GetHomeData {
  final HomeRepository repository;

  GetHomeData({required this.repository});

  /// Execute use case
  Future<Either<Failure, HomeData>> call() {
    return repository.getHomeData();
  }
}
