import 'package:flutter/material.dart';
import 'package:flutterbloc/constans/strings.dart';
import 'package:flutterbloc/presentation/screens/characthers_screen.dart';
import 'package:flutterbloc/presentation/screens/details_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(builder: (_) => CharacterScreen());


      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }

  }
}
