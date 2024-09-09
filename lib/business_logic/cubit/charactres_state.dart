part of 'charactres_cubit.dart';

@immutable
sealed class CharactresState {}

final class CharactresInitial extends CharactresState {}


final class CharactresLoaded extends CharactresState {
  final List<Results> characters;
  CharactresLoaded({required this.characters});
}
