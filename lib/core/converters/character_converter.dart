import 'package:casino_test/features/characters/data/models/character_model.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';

abstract class CharacterConverter {
  PaginatedCharacter toPaginatedCharacter(
    PaginatedCharacterModel paginatedCharacterModel,
  );

  PaginationInfo toPaginationInfo(PaginationInfoModel paginationInfoModel);
}

class CharacterConverterImpl implements CharacterConverter {
  @override
  PaginatedCharacter toPaginatedCharacter(
    PaginatedCharacterModel paginatedCharacterModel,
  ) {
    return PaginatedCharacter(
      info: toPaginationInfo(paginatedCharacterModel.info),
      results: paginatedCharacterModel.results
          .map((e) => Character(id: e.id, name: e.name, image: e.image))
          .toList(),
    );
  }

  @override
  PaginationInfo toPaginationInfo(PaginationInfoModel paginationInfoModel) {
    return PaginationInfo(
      count: paginationInfoModel.count,
      pages: paginationInfoModel.pages,
      next: paginationInfoModel.next,
      prev: paginationInfoModel.prev,
    );
  }
}
