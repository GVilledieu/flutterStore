import 'package:flutter/foundation.dart';

class CategoryNameProvider extends ChangeNotifier {
  String _selectedCategory = '';

  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
