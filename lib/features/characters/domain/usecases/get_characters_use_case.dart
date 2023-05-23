import 'package:casino_test/core/typedefs/typedefs.dart';
import 'package:casino_test/core/usecases/use_case.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:casino_test/features/characters/domain/repositories/characters_repository.dart';
import 'package:equatable/equatable.dart';

class GetCharactersUseCase extends UseCase<PaginatedCharacter, Params> {
  final CharactersRepository repository;

  GetCharactersUseCase(this.repository);

  @override
  FutureEither<PaginatedCharacter> call(Params params) async {
    return await repository.getCharacters(params.pageNo);
  }
}

class Params extends Equatable {
  final int pageNo;

  const Params({required this.pageNo});

  @override
  List<Object> get props => [pageNo];
}
