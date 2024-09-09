import 'package:flutter/material.dart';
import 'package:rick_and_morty/RouterApp.dart';

void main() {
  runApp(RickAndMortyApp(
    routerApp: RouterApp(),
  ));
}

class RickAndMortyApp extends StatelessWidget {
  final RouterApp routerApp;

  const RickAndMortyApp({super.key, required this.routerApp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routerApp.gotoRoute,
    );
  }
}
