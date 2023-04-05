import 'package:breaking_bad_bloc/BLOC/characters_cubit.dart';
import 'package:breaking_bad_bloc/BLOC/quotes_cubit.dart';
import 'package:breaking_bad_bloc/Data/Models/GOTCharacter.dart';
import 'package:breaking_bad_bloc/Data/Repository/characters_repos.dart';
import 'package:breaking_bad_bloc/Presentation/Screens/character_details_screen.dart';
import 'package:breaking_bad_bloc/Presentation/Screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Data/Api_Web_Services/characters_api.dart';
import 'constants/strings.dart';

class AppRouter {
  late GotCharacterRepository gotCharacterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    gotCharacterRepository = GotCharacterRepository(GotCharactersWebServers());
    charactersCubit = CharactersCubit(gotCharacterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => charactersCubit,
              child: const CharactersScreen(),
            ));
      case characterDetailsScreen:
        GotCharacter character = settings.arguments as GotCharacter;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => QuotesCubit(GotCharacterRepository(GotCharactersWebServers())),
              child: CharacterDetailsScreen(character: character,),
            ));
    }
    return null;
  }
}