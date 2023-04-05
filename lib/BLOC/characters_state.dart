part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState{
  final List<GotCharacter> gotCharacters;

  CharactersLoaded(this.gotCharacters);
}

class CharactersErrorCase extends CharactersState{}