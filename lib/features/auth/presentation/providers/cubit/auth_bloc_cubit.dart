import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:redact_safe/features/auth/domain/use_cases/auth_use_case_bundle.dart';
import 'package:redact_safe/features/auth/domain/use_cases/sign_in_using_email_password.dart';
import 'package:redact_safe/features/auth/domain/use_cases/sign_up_using_email_password.dart';

part 'auth_bloc_state.dart';
class AuthBlocCubit extends Cubit<AuthBlocState> {
  final AuthUseCaseBundle authUseCaseBundle;
  AuthBlocCubit({required this.authUseCaseBundle}) : super(AuthBlocInitial());

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthBlocLoading());
    final result = await authUseCaseBundle.signInUsingEmailPassword(
      SignInParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthBlocFailure(error: failure.message)),
      (_) => emit(AuthBlocSuccess(message: "Signed in successfully")),
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthBlocLoading());
    final result = await authUseCaseBundle.signUpUsingEmailPassword(
      SignUpParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthBlocFailure(error: failure.message)),
      (_) => emit(AuthBlocSuccess(message: "Signed up successfully")),
    );
  }
  
}
