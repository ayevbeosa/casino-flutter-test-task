import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
