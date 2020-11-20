// To parse this JSON data, do
//
//     final marsRoverPhotos = marsRoverPhotosFromJson(jsonString);

import 'dart:convert';

class MarsRoverPhotos {
  MarsRoverPhotos({
    this.photos,
  });

  List<Photo> photos;

  static MarsRoverPhotos marsRoverPhotosFromJson(String str) => MarsRoverPhotos.fromJson(json.decode(str));

  static String marsRoverPhotosToJson(MarsRoverPhotos data) => json.encode(data.toJson());

  factory MarsRoverPhotos.fromJson(Map<String, dynamic> json) => MarsRoverPhotos(
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Photo {
  Photo({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
    this.rover,
  });

  int id;
  int sol;
  Camera camera;
  String imgSrc;
  DateTime earthDate;
  Rover rover;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    sol: json["sol"],
    camera: Camera.fromJson(json["camera"]),
    imgSrc: json["img_src"],
    earthDate: DateTime.parse(json["earth_date"]),
    rover: Rover.fromJson(json["rover"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sol": sol,
    "camera": camera.toJson(),
    "img_src": imgSrc,
    "earth_date": "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
    "rover": rover.toJson(),
  };
}

class Camera {
  Camera({
    this.id,
    this.name,
    this.roverId,
    this.fullName,
  });

  int id;
  String name;
  int roverId;
  String fullName;

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
    id: json["id"],
    name: json["name"],
    roverId: json["rover_id"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "rover_id": roverId,
    "full_name": fullName,
  };
}

class Rover {
  Rover({
    this.id,
    this.name,
    this.landingDate,
    this.launchDate,
    this.status,
  });

  int id;
  String name;
  DateTime landingDate;
  DateTime launchDate;
  String status;

  factory Rover.fromJson(Map<String, dynamic> json) => Rover(
    id: json["id"],
    name: json["name"],
    landingDate: DateTime.parse(json["landing_date"]),
    launchDate: DateTime.parse(json["launch_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "landing_date": "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
    "launch_date": "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
