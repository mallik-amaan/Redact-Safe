import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/features/auth/domain/data_sources/auth_remote_data_source.dart';
import 'package:redact_safe/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    try {
      final result = await authRemoteDataSource.isSignedIn();
      return Right(result);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.signInWithEmailAndPassword(email, password);
      return Right(user);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure,bool>> signOut() async {
    try{
      final result = await authRemoteDataSource.signOut();
      return Right(result);
    }
    catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure,User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  })async {
    try {
      final user =await authRemoteDataSource.signUpWithEmailAndPassword(email, password);
      return Right(user);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
