import 'package:get_it/get_it.dart';

import 'features/login/data/data_sources/auth_data_source.dart';
import 'features/login/data/repositories/auth_repository_impl.dart';
import 'features/login/domain/use_cases/login_use_case.dart';
import 'features/login/presentation/manager/auth_bloc.dart';

final getIt = GetIt.instance;

void serviceLocator() async {
  /// Data Sources
  //Auth
  getIt.registerLazySingleton(
    () => AuthRemoteDataSource(),
  );

  /// Repositories
  //Auth
  getIt.registerLazySingleton(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  /// Use Cases
  //Auth
  getIt.registerLazySingleton(
    () => LoginUseCase(
      getIt<AuthRepositoryImpl>(),
    ),
  );

  /// Bloc
  //Auth
  getIt.registerFactory(
    () => AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );

  /// Outside
}
