import 'package:flutter/material.dart';
import 'package:flutterbloc/presentation/app_routes.dart';

void main() {
  runApp(  RickMortyApp(appRouter: AppRouter(),));
}

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,

    );
  }
}


