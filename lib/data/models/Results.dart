import 'package:rick_and_morty/data/models/Location.dart';
import 'package:rick_and_morty/data/models/Origin.dart';

class Results{

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      origin: Origin.fromJson(json['origin'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
      image: json['image'] ?? '',
      episode: (json['episode'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      url: json['url'] ?? '',
      created: json['created'] ?? '',
    );
  }
}



