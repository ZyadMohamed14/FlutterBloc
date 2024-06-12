import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/business_logic/characters_cubit.dart';
import 'package:flutterbloc/constans/strings.dart';
import 'package:flutterbloc/data/repo/chara_repo.dart';
import 'package:flutterbloc/data/web_services/character_services.dart';
import 'package:flutterbloc/presentation/app_routes.dart';
import 'package:flutterbloc/presentation/screens/characthers_screen.dart';
import 'package:flutterbloc/presentation/screens/details_screen.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(characterRepository),
            child: CharacterScreen(),
          ),
        );

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
