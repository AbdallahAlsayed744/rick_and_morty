// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rick_and_morty/data/api/Charactres_api.dart';
import 'package:rick_and_morty/data/models/Character.dart';
import 'package:rick_and_morty/data/models/Results.dart';

class Charater_Reposatory {

  late Charactres_api charactres_api;

  Charater_Reposatory({required this.charactres_api,});

  Future<List<Results>> getCharacters() async {
    final characters = await charactres_api.getCharacters();
    return characters.map((character) => Results.fromJson(character)).toList();
  }

}
