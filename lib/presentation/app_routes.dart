import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/business_logic/characters_cubit.dart';
import 'package:flutterbloc/business_logic/location_cubit.dart';
import 'package:flutterbloc/constans/strings.dart';
import 'package:flutterbloc/data/model/Character.dart';
import 'package:flutterbloc/data/model/Location.dart';
import 'package:flutterbloc/data/repo/chara_repo.dart';
import 'package:flutterbloc/data/repo/location_repo.dart';
import 'package:flutterbloc/data/web_services/character_services.dart';
import 'package:flutterbloc/data/web_services/location_webSevices.dart';
import 'package:flutterbloc/presentation/app_routes.dart';
import 'package:flutterbloc/presentation/screens/characthers_screen.dart';
import 'package:flutterbloc/presentation/screens/details_screen.dart';
import 'package:flutterbloc/presentation/screens/location_screen.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  late LocationRepository locationRepository;
  late LocationCubit locationCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);

    locationRepository = LocationRepository(LocationWebServices());
    locationCubit = LocationCubit(locationRepository);
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
        final selectedCharacter = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) =>
                CharacterDetailsScreen(character: selectedCharacter));

      case locationDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => locationCubit,
            child: LocationScreen(),
          ),
        );
    }
  }
}
