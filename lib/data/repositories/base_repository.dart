import '../../domain/entities/base_entity.dart';
import '../datasources/base_datasource.dart';

abstract class BaseRepository <T extends BaseEntity> {
  final BaseDataSource<T> dataSource;
  BaseRepository(this.dataSource);
  Future<List<T>> getAll() async{
    return await dataSource.fetchData();
  }
}