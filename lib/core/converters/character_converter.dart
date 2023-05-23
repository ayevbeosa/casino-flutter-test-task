import 'package:casino_test/features/characters/data/models/character_model.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';

abstract class CharacterConverter {
  PaginatedCharacter toPaginatedCharacter(
    PaginatedCharacterModel paginatedCharacterModel,
  );

  PaginationInfo toPaginationInfo(PaginationInfoModel paginationInfoModel);

  Character toCharacter(CharacterModel characterModel);
}

class CharacterConverterImpl implements CharacterConverter {
  @override
  PaginatedCharacter toPaginatedCharacter(
    PaginatedCharacterModel paginatedCharacterModel,
  ) {
    return PaginatedCharacter(
      info: toPaginationInfo(paginatedCharacterModel.info),
      results:
          paginatedCharacterModel.results.map((e) => toCharacter(e)).toList(),
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

  @override
  Character toCharacter(CharacterModel characterModel) {
    return Character(
      id: characterModel.id,
      name: characterModel.name,
      image: characterModel.image,
      gender: characterModel.gender,
      species: characterModel.species,
      status: characterModel.status,
      episode: characterModel.episode,
      location: Location(
        name: characterModel.location.name,
        url: characterModel.location.url,
      ),
    );
  }
}
