part of 'character_bloc.dart';

enum CharacterStatus { initial, loading, success, error }

class CharacterState extends Equatable {
  final CharacterStatus status;
  final List<Character> characters;
  final bool hasReachedMax;
  final String errorMessage;

  const CharacterState({
    this.status = CharacterStatus.initial,
    this.characters = const <Character>[],
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  CharacterState copyWith({
    CharacterStatus? status,
    List<Character>? characters,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return CharacterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, characters, hasReachedMax, errorMessage];
}
