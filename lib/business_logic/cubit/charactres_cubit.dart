import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/Character.dart';
import 'package:rick_and_morty/data/models/Results.dart';
import 'package:rick_and_morty/data/reposatries/Charater_Reposatory.dart';

part 'charactres_state.dart';

class CharactresCubit extends Cubit<CharactresState> {
  final Charater_Reposatory charaterReposatory;

  CharactresCubit(this.charaterReposatory) : super(CharactresInitial());

  List<Results> characters = [];

  // static CharactresCubit get(context) =>BlocProvider.of<CharactresCubit>(context);

  List<Results>? getCharacters() {
    charaterReposatory.getCharacters().then((characters) {
      emit(CharactresLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
