import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redact_safe/features/doc_redact/domain/use_cases/DocRedactionUseCaseBundle.dart';
import 'package:redact_safe/features/doc_redact/presentation/providers/doc_redaction_state.dart';

class DocRedactionCubit extends Cubit<DocRedactionState> {
  final DocRedactionUsecaseBundle docRedactionUsecaseBundle;

  //initial state
  DocRedactionCubit({required this.docRedactionUsecaseBundle})
    : super(DocRedactionInit());

  void redactDocument() async {
    emit(DocRedactionLoading());
    final result = await docRedactionUsecaseBundle.docRedaction("");
    result.fold(
      (failure) => emit(DocRedactionError(failure.message)),
      (jobID) => emit(DocRedactionSuccess()),
    );
  }
}
