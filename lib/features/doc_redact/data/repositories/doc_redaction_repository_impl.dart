import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';
import 'package:redact_safe/features/doc_redact/domain/repositories/doc_redaction_repository.dart';

class DocRedactionRepositoryImpl extends DocRedactionRepository{
  @override
  Future<Either<Failure, String>> getRedactedDocument() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> redactDocument() {
    throw UnimplementedError();
  }

  
}