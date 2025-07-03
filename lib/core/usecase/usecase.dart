import 'package:fpdart/fpdart.dart';
import 'package:redact_safe/core/error/failure.dart';

abstract interface class UseCase<Type, Params> {
 Future<Either<Failure, Type>> call(Params params);
}