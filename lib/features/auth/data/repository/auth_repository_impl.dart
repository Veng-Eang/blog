import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/error/server_exceptions.dart';
import 'package:clean_architecture/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final usrId = await authRemoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(usrId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
