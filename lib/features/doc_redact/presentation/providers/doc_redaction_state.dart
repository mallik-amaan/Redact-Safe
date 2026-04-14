import 'package:equatable/equatable.dart';

sealed class DocRedactionState extends Equatable {
  const DocRedactionState();

  @override
  List<Object> get props => [];
}

//Initial State
final class DocRedactionInit extends DocRedactionState {}

//Loading State while redaction is still in process
final class DocRedactionLoading extends DocRedactionState {}

final class DocRedactionSuccess extends DocRedactionState {}

//error state, returns the error message
final class DocRedactionError extends DocRedactionState {
  final String message;

  const DocRedactionError(this.message);

  @override
  List<Object> get props => [message];
}

