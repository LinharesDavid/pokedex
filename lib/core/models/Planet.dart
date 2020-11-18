import 'package:archi_app/core/models/JsonModel.dart';

class Planet extends JsonModel{
  Planet({
    this.characters,
    this.description,
    this.image,
    this.name,
    this.region,
    this.species,
    this.system,
  });

  String characters;
  String description;
  String image;
  String name;
  String region;
  String species;
  String system;

  factory Planet.fromJson(Map<String, dynamic> json) => Planet(
    characters: json["characters"],
    description: json["description"],
    image: json["image"],
    name: json["name"],
    region: json["region"],
    species: json["species"],
    system: json["system"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "characters": characters,
    "description": description,
    "image": image,
    "name": name,
    "region": region,
    "species": species,
    "system": system,
  };
}