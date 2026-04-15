import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../storage/local_storage.dart';
import '../security/secure_storage.dart';
import '../network/api_client.dart';
import '../network/network_info.dart';
import '../security/token_manager.dart';
import '../security/biometric_auth.dart';
import '../security/app_lock.dart';
import '../../data/datasources/remote/home_remote_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_home_data.dart';
import '../../presentation/features/home/bloc/home_bloc.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Configure dependency injection
Future<void> configureDependencies() async {
  // Register core services
  await _registerCoreServices();
}

/// Register core services
Future<void> _registerCoreServices() async {
  // Storage services
  getIt.registerSingletonAsync<LocalStorage>(() async {
    return LocalStorage();
  });

  getIt.registerSingletonAsync<SecureStorageWrapper>(() async {
    return SecureStorageWrapper();
  });

  // Network services
  getIt.registerSingletonAsync<ApiClient>(() async {
    final secureStorage = await getIt.getAsync<SecureStorageWrapper>();
    return ApiClient(secureStorage: secureStorage);
  });

  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl());

  // Security services
  getIt.registerSingletonAsync<TokenManager>(() async {
    final secureStorage = await getIt.getAsync<SecureStorageWrapper>();
    return TokenManager(secureStorage: secureStorage);
  });

  getIt.registerSingletonAsync<BiometricAuth>(() async {
    return BiometricAuth();
  });

  getIt.registerSingletonAsync<AppLock>(() async {
    final localStorage = await getIt.getAsync<LocalStorage>();
    return AppLock(localStorage: localStorage);
  });

  // Register Home feature dependencies
  getIt.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSource());
  getIt.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt<HomeRemoteDataSource>()),
  );
  getIt.registerFactory<GetHomeData>(
    () => GetHomeData(repository: getIt<HomeRepository>()),
  );
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getHomeData: getIt<GetHomeData>()),
  );

  // Wait for all async registrations to complete
  await getIt.allReady();
}

/// Reset all dependencies (useful for testing)
Future<void> resetDependencies() async {
  await getIt.reset();
}
