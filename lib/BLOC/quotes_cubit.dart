import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Data/Models/CharactersQuotes.dart';
import '../Data/Repository/characters_repos.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final GotCharacterRepository characterRepository;
  List<CharactersQuotes> characters=[];

  QuotesCubit(this.characterRepository) : super(QuotesInitial());

  List<CharactersQuotes> getAllCharacters(){
    characterRepository.getAllQuotes().then((characters) {
      emit(QuotesLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
