import 'package:casino_test/core/typedefs/typedefs.dart';

abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}
