import 'package:breaking_bad_bloc/BLOC/characters_cubit.dart';
import 'package:breaking_bad_bloc/Presentation/Screens/character_details.dart';
import 'package:breaking_bad_bloc/Presentation/Screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/Api_Web_Services/characters_api.dart';
import 'constants/strings.dart';

class AppRouter {
  late Api api;
  late CharactersCubit charactersCubit;

  AppRouter() {
    api = Api();
    charactersCubit = CharactersCubit(api);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => charactersCubit,
              child: CharactersScreen(),
            ));
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}