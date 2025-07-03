import 'package:redact_safe/features/auth/domain/data_sources/auth_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final instance = FirebaseAuth.instance;

  @override
Future<User> signInWithEmailAndPassword(String email, String password) async {
  try {
    final result = await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;
    if (user != null) {
      return user;
    } else {
      throw Exception('User is null');
    }
  } catch (e) {
    throw Exception('Sign-in failed: $e');
  }
}

  @override
  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final result = await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      if (user != null) {
        return user;
      } else {
        throw Exception('User is null');
      }
    } catch (E) {
      throw Exception(E);
    }
  }

  @override
  Future<void> signInWithGoogle() async {}
  @override
  Future<bool> signOut() async {
    try {
      await instance.signOut();
      return true;
    } catch (e) {
      throw Exception('Sign-out failed: $e');
    }
  }
  @override
  Future<void> resetPassword(String email) async {}

  @override
  Future<bool> isSignedIn() async {
    return true;
  }
}
