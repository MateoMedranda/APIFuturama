import 'base_entity.dart';

class CharacterEntity extends BaseEntity{
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species
  });

}