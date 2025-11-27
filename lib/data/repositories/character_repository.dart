import '../../domain/entities/character.dart';
import '../datasources/base_datasource.dart';
import 'base_repository.dart';

class CharactersRepository extends BaseRepository<CharacterEntity> {
  CharactersRepository(BaseDataSource<CharacterEntity> datasource)
      : super(datasource);
}