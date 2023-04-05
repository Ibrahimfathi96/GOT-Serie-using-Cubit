import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Data/Api_Web_Services/characters_api.dart';
import '../Data/Models/character.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final Api api;
  List<Character> chars =[];

  CharactersCubit(this.api) : super(CharactersInitial());

  List<Character> getAllCharacters(){
    api.getCharacters().then((characters){
      emit(CharactersLoaded(characters!));
      chars = characters;
    });
    return chars;
  }
}
