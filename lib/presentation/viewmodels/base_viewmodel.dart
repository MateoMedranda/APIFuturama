import 'package:flutter/material.dart';
import '../../domain/entities/base_entity.dart';
import '../../domain/usecases/get_data_usecase.dart';

class BaseViewModel<T extends BaseEntity> extends ChangeNotifier {
  final GetDataUseCase<T> useCase;

  BaseViewModel(this.useCase);

  List<T> items = [];
  bool loading = false;
  String? error;
  
  // Paginación
  int currentPage = 1;
  int itemsPerPage = 10;
  List<T> paginatedItems = [];

  Future<void> loadData() async {
    loading = true;
    notifyListeners();

    try {
      items = await useCase();
      _updatePaginatedItems();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  void _updatePaginatedItems() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    
    paginatedItems = items.length > endIndex 
        ? items.sublist(startIndex, endIndex)
        : items.sublist(startIndex);
  }

  void nextPage() {
    final maxPages = (items.length / itemsPerPage).ceil();
    if (currentPage < maxPages) {
      currentPage++;
      _updatePaginatedItems();
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPage > 1) {
      currentPage--;
      _updatePaginatedItems();
      notifyListeners();
    }
  }

  int getTotalPages() {
    return items.isEmpty ? 1 : (items.length / itemsPerPage).ceil();
  }
}
