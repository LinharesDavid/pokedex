import 'package:archi_app/core/models/JsonModel.dart';

class Species extends JsonModel {
  Species({
    this.characters,
    this.classification,
    this.description,
    this.image,
    this.language,
    this.name,
    this.planet,
  });

  int characters;
  String classification;
  String description;
  String image;
  String language;
  String name;
  String planet;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    characters: json["characters"],
    classification: json["classification"],
    description: json["description"],
    image: json["image"],
    language: json["language"],
    name: json["name"],
    planet: json["planet"],
  );

  @override
  Map toJson()  => {
    "characters": characters,
    "classification": classification,
    "description": description,
    "image": image,
    "language": language,
    "name": name,
    "planet": planet,
  };
}