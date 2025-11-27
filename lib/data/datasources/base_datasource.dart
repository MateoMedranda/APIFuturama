abstract class BaseDataSource<T>{
  Future<List<T>> fetchData();
}