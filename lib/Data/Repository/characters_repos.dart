import 'package:breaking_bad_bloc/Data/Api_Web_Services/characters_api.dart';
import 'package:breaking_bad_bloc/Data/Models/CharactersQuotes.dart';
import 'package:breaking_bad_bloc/Data/Models/GOTCharacter.dart';

class GotCharacterRepository{
  final GotCharactersWebServers gotCharactersWebServers;
  GotCharacterRepository(this.gotCharactersWebServers);

  Future<List<GotCharacter>> getAllCharacters()async{
    final gotCharacters = await gotCharactersWebServers.getAllCharacters();
    return gotCharacters.map((character) => GotCharacter.fromJson(character)).toList();
  }
  Future<List<CharactersQuotes>> getAllQuotes()async{
    final gotCharacters = await gotCharactersWebServers.getAllQuotes();
    return gotCharacters.map((character) => CharactersQuotes.fromJson(character)).toList();
  }


}