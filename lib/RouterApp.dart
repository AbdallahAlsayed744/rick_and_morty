import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/charactres_cubit.dart';
import 'package:rick_and_morty/costants/Routes.dart';
import 'package:rick_and_morty/data/api/Charactres_api.dart';
import 'package:rick_and_morty/data/models/Results.dart';
import 'package:rick_and_morty/data/reposatries/Charater_Reposatory.dart';
import 'package:rick_and_morty/presentation/screens/CharctersScreen.dart';
import 'presentation/screens/CharacterScreenDetails.dart';

class RouterApp {

  late Charater_Reposatory characterrepo;
  late CharactresCubit charactresCubit;

  RouterApp(){

    characterrepo = Charater_Reposatory(charactres_api: Charactres_api());
    charactresCubit = CharactresCubit(characterrepo);
    

  }


  Route? gotoRoute(RouteSettings setting) {
    switch (setting.name) {
      case CharactresRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => charactresCubit, child: const CharctersScreen()));

      case Characterdetails:
      final mychar = setting.arguments as Results;
        return MaterialPageRoute(
            builder: (_) =>  CharacterScreenDetails(char: mychar));
    }
  }
}
