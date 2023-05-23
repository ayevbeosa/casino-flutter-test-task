part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class GetCharacters extends CharacterEvent {
  const GetCharacters();

  @override
  List<Object?> get props => [];
}
