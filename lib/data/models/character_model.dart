import '../../domain/entities/character.dart';

class CharacterModel extends CharacterEntity {

  CharacterModel({
    required int id,
    required String name,
    required String image,
    required String status,
    required String species,
  }): super(
    id: id,
    name: name,
    image: image,
    status: status,
    species: species,
  );

  factory CharacterModel.fromJson(Map<String, dynamic> json){
    return CharacterModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        species: json["species"]
    );
  }
}