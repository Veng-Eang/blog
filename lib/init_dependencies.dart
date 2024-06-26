import 'package:clean_architecture/core/secrets/app_secrets.dart';
import 'package:clean_architecture/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:clean_architecture/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture/features/auth/domain/usecase/user_sign_up.dart';
import 'package:clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // Datasource
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDateSourceImpl(
      serviceLocator(),
    ),
  );

  // auth repository implementation
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  // usercase
  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  // bloc
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
    ),
  );
}
