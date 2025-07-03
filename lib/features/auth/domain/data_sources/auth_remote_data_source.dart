import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {

  /// Signs in a user with email and password.
  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Signs up a user with email and password.
  Future<User> signUpWithEmailAndPassword(
    String email,
    String password,
  );

  /// Signs in a user with Google authentication.
  Future<void> signInWithGoogle();

  /// Signs out the current user.
  Future<bool> signOut();

  /// Resets the password for the given email.
  Future<void> resetPassword(String email);

  /// Checks if a user is signed in.
  Future<bool> isSignedIn();
}