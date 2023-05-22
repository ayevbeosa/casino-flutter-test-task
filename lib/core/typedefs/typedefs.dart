import 'package:casino_test/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
