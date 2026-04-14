import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';

abstract class DocRedactionRepository {
  Future<Either<Failure, bool>> redactDocument();
  Future<Either<Failure, String>> getRedactedDocument();
}
