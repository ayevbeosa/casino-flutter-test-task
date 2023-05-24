import 'package:casino_test/core/error/server_exception.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<ServerException, T>>;
