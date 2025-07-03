import 'package:redact_safe/features/auth/domain/use_cases/sign_in_using_email_password.dart';
import 'package:redact_safe/features/auth/domain/use_cases/sign_up_using_email_password.dart';

class AuthUseCaseBundle {
  final SignInUsingEmailPassword signInUsingEmailPassword;
  final SignUpUsingEmailPassword signUpUsingEmailPassword;

const AuthUseCaseBundle({
    required this.signInUsingEmailPassword,
    required this.signUpUsingEmailPassword,
  });
}