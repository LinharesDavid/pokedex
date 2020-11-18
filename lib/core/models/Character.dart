import 'package:archi_app/core/models/JsonModel.dart';

class Character extends JsonModel {
  String birth;
  String description;
  String gender;
  String height;
  String image;
  String name;
  String planet;
  String species;

  Character({
    this.birth,
    this.description,
    this.gender,
    this.height,
    this.image,
    this.name,
    this.planet,
    this.species,
  });

  @override
  Map<String, dynamic> toJson() => {
        "birth": birth,
        "description": description,
        "gender": gender,
        "height": height,
        "image": image,
        "name": name,
        "planet": planet,
        "species": species,
  };

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    birth: json["birth"],
    description: json["description"],
    gender: json["gender"],
    height: json["height"],
    image: json["image"],
    name: json["name"],
    planet: json["planet"],
    species: json["species"],
  );
}
