part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class Initial extends CharacterState {
  @override
  List<Object> get props => [];
}

class Loading extends CharacterState {
  @override
  List<Object> get props => [];
}

class Success extends CharacterState {
  final Character character;

  const Success(this.character);

  @override
  List<Object> get props => [character];
}

class Error extends CharacterState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
