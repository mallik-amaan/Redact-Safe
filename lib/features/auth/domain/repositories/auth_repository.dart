import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure,User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure,User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure,bool>> signOut();

  Future<Either<Failure,bool>> isSignedIn();
}
