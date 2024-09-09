import 'package:rick_and_morty/data/models/Info.dart';
import 'package:rick_and_morty/data/models/Results.dart';

class Character {
  final Info info;
  final List<Results> results;

  Character({required this.info, required this.results});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      info: Info.fromJson(json['info'] ?? {}),
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => Results.fromJson(item))
              .toList() ??
          [],
          
    );
  }
}