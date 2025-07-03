part of 'auth_bloc_cubit.dart';

sealed class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthBlocLoading extends AuthBlocState {}

final class AuthBlocSuccess extends AuthBlocState {
  final String message;

  const AuthBlocSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class AuthBlocFailure extends AuthBlocState {
  final String error;

  const AuthBlocFailure({required this.error});

  @override
  List<Object> get props => [error];
}
final class AuthBlocSignedOut extends AuthBlocState {
  final String message;

  const AuthBlocSignedOut({required this.message});

  @override
  List<Object> get props => [message];
}
