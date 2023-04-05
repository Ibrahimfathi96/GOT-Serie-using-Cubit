import 'package:bloc/bloc.dart';
import 'package:breaking_bad_bloc/Data/Models/GOTCharacter.dart';
import 'package:meta/meta.dart';
import '../Data/Repository/characters_repos.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final GotCharacterRepository characterRepository;
  List<GotCharacter> characters=[];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<GotCharacter> getAllCharacters(){
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
