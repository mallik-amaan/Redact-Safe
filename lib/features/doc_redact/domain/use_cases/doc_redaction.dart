import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/core/usecase/usecase.dart';
import 'package:redact_safe/features/doc_redact/domain/repositories/doc_redaction_repository.dart';

class DocRedaction implements UseCase<bool, String> {
  final DocRedactionRepository docRedactionRepository;
  const DocRedaction({required this.docRedactionRepository});
  @override
  Future<Either<Failure, bool>> call(String params) {
    return docRedactionRepository.redactDocument();
  }
}
