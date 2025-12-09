import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int _previousIndex = 0;
  int get selectedIndex => _selectedIndex;
  int get previousIndex => _previousIndex;

  void setIndex(int index) {
    if (_selectedIndex != index) {
      _previousIndex = _selectedIndex;
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void resetToHome() {
    if (_selectedIndex != 0) {
      _previousIndex = _selectedIndex;
      _selectedIndex = 0;
      notifyListeners();
    }
  }

  void goToPrevious() {
    final temp = _selectedIndex;
    _selectedIndex = _previousIndex;
    _previousIndex = temp;
    notifyListeners();
  }

  bool isOnTab(int index) => _selectedIndex == index;
  bool get isOnHome => _selectedIndex == 0;
  bool get isOnJobBoard => _selectedIndex == 1;
  bool get isOnJobPosting => _selectedIndex == 2;
  bool get isOnSettings => _selectedIndex == 3;
}
