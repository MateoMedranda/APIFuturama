import 'package:flutter/material.dart';
import '../../domain/entities/base_entity.dart';
import '../../domain/usecases/get_data_usecase.dart';

class BaseViewModel<T extends BaseEntity> extends ChangeNotifier {
  final GetDataUseCase<T> useCase;

  BaseViewModel(this.useCase);

  List<T> items = [];
  bool loading = false;
  String? error;

  Future<void> loadData() async {
    loading = true;
    notifyListeners();

    try {
      items = await useCase();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
