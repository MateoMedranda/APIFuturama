import '../../domain/entities/character.dart';

class CharacterModel extends CharacterEntity {

  CharacterModel({
    required int id,
    required String name,
    required String gender,
    required String image,
    required String status,
    required String species,
  }): super(
    id: id,
    name: name,
    gender: gender,
    image: image,
    status: status,
    species: species,
  );

  factory CharacterModel.fromJson(Map<String, dynamic> json){
    return CharacterModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "Sin nombre",
        gender: json["gender"] ?? "Unknown",
        image: json["image"] ?? "https://via.placeholder.com/150",
        status: json["status"] ?? "Unknown",
        species: json["species"] ?? "Unknown"
    );
  }
}