// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

class Item {
  Item({
    this.attributes,
    this.babyTriggerFor,
    this.category,
    this.cost,
    this.effectEntries,
    this.flavorTextEntries,
    this.flingEffect,
    this.flingPower,
    this.gameIndices,
    this.heldByPokemon,
    this.id,
    this.machines,
    this.name,
    this.names,
    this.sprites,
  });

  List<Category> attributes;
  dynamic babyTriggerFor;
  Category category;
  int cost;
  List<EffectEntry> effectEntries;
  List<FlavorTextEntry> flavorTextEntries;
  dynamic flingEffect;
  dynamic flingPower;
  List<GameIndex> gameIndices;
  List<dynamic> heldByPokemon;
  int id;
  List<dynamic> machines;
  String name;
  List<Name> names;
  Sprites sprites;

  static Item itemFromJson(String str) => Item.fromJson(json.decode(str));

  static String itemToJson(Item data) => json.encode(data.toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    attributes: List<Category>.from(json["attributes"].map((x) => Category.fromJson(x))),
    babyTriggerFor: json["baby_trigger_for"],
    category: Category.fromJson(json["category"]),
    cost: json["cost"],
    effectEntries: List<EffectEntry>.from(json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
    flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
    flingEffect: json["fling_effect"],
    flingPower: json["fling_power"],
    gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
    heldByPokemon: List<dynamic>.from(json["held_by_pokemon"].map((x) => x)),
    id: json["id"],
    machines: List<dynamic>.from(json["machines"].map((x) => x)),
    name: json["name"],
    names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    sprites: Sprites.fromJson(json["sprites"]),
  );

  Map<String, dynamic> toJson() => {
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "baby_trigger_for": babyTriggerFor,
    "category": category.toJson(),
    "cost": cost,
    "effect_entries": List<dynamic>.from(effectEntries.map((x) => x.toJson())),
    "flavor_text_entries": List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
    "fling_effect": flingEffect,
    "fling_power": flingPower,
    "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
    "held_by_pokemon": List<dynamic>.from(heldByPokemon.map((x) => x)),
    "id": id,
    "machines": List<dynamic>.from(machines.map((x) => x)),
    "name": name,
    "names": List<dynamic>.from(names.map((x) => x.toJson())),
    "sprites": sprites.toJson(),
  };
}

class Category {
  Category({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class EffectEntry {
  EffectEntry({
    this.effect,
    this.language,
    this.shortEffect,
  });

  String effect;
  Category language;
  String shortEffect;

  factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
    effect: json["effect"],
    language: Category.fromJson(json["language"]),
    shortEffect: json["short_effect"],
  );

  Map<String, dynamic> toJson() => {
    "effect": effect,
    "language": language.toJson(),
    "short_effect": shortEffect,
  };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.language,
    this.text,
    this.versionGroup,
  });

  Category language;
  String text;
  Category versionGroup;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
    language: Category.fromJson(json["language"]),
    text: json["text"],
    versionGroup: Category.fromJson(json["version_group"]),
  );

  Map<String, dynamic> toJson() => {
    "language": language.toJson(),
    "text": text,
    "version_group": versionGroup.toJson(),
  };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.generation,
  });

  int gameIndex;
  Category generation;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
    gameIndex: json["game_index"],
    generation: Category.fromJson(json["generation"]),
  );

  Map<String, dynamic> toJson() => {
    "game_index": gameIndex,
    "generation": generation.toJson(),
  };
}

class Name {
  Name({
    this.language,
    this.name,
  });

  Category language;
  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    language: Category.fromJson(json["language"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "language": language.toJson(),
    "name": name,
  };
}

class Sprites {
  Sprites({
    this.spritesDefault,
  });

  String spritesDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    spritesDefault: json["default"],
  );

  Map<String, dynamic> toJson() => {
    "default": spritesDefault,
  };
}
