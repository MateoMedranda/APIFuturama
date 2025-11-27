import '../entities/base_entity.dart';
import '../../data/repositories/base_repository.dart';

class GetDataUseCase<T extends BaseEntity>{
  final BaseRepository<T> repository;

  GetDataUseCase(this.repository);

  Future<List<T>>call() async{
    return await repository.getAll();
  }
}