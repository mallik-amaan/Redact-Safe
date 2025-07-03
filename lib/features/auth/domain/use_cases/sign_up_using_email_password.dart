import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/core/usecase/usecase.dart';
import 'package:redact_safe/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsingEmailPassword implements UseCase<void,SignUpParams>{
 final AuthRepository _authRepository;

  SignUpUsingEmailPassword(this._authRepository);

  @override
  Future<Either<Failure, void>> call(SignUpParams params) {
    return _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({
    required this.email,
    required this.password,
  });
}