import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/core/usecase/usecase.dart';
import 'package:redact_safe/features/auth/domain/repositories/auth_repository.dart';

class SignInUsingEmailPassword implements UseCase<void, SignInParams> {
  final AuthRepository _authRepository;

  SignInUsingEmailPassword(this._authRepository);

  @override
  Future<Either<Failure, void>> call(SignInParams params) {
    return _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}