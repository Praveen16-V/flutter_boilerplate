import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/api_client.dart';
import '../../domain/entities/home_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/home_remote_datasource.dart';

/// Home repository implementation
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      final homeData = await remoteDataSource.getHomeData();
      return Right(homeData);
    } on ServerException {
      return const Left(ServerFailure());
    } on NetworkException {
      return const Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
