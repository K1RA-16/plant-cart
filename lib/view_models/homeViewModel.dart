import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_cart/utils/dbStruct.dart';

import '../utils/db.dart';

class HomeViewModel extends ChangeNotifier {
  String _selectedOptionText = "";
  List<dynamic> optionList = [];
  int _selectedOption = 0;
  List<DbStruct> _plantData = [];
  List<DbStruct> _currentData = [];

  List<DbStruct> get currentData => _currentData;
  List<DbStruct> get plantData => _plantData;
  String get selectedOptionText => _selectedOptionText;
  int get selectedOption => _selectedOption;
  bool _menu = false;

  bool get menu => _menu;

  void select(int option) {
    _selectedOption = option;
    loadPage(selectedOption);
  }

  setMenu(value) {
    _menu = value;
    notifyListeners();
  }

  void loadPage(int selectedOption) {
    print(selectedOption);
    try {
      _currentData.clear();
      _selectedOptionText = optionList[selectedOption];
      for (var plant in plantData) {
        if (plant.category == selectedOptionText) _currentData.add(plant);
      }
      Db.currentData = _currentData;
      notifyListeners();
    } on Exception catch (e) {
      print("no category exists");
    }
  }

  Future<void> readJson() async {
    String response = await rootBundle.loadString('assets/flowers.json');
    final data = await json.decode(response);
    Db.data = List.from(data['flowerlist'])
        .map<DbStruct>((item) => DbStruct.fromMap(item))
        .toList();
    Db.categories = data['categories'];
// ...
  }

  Future<void> loadDb() async {
    try {
      await readJson();
      _plantData = Db.data;
      optionList = Db.categories;
    } on Exception catch (e) {
      // TODO
    }
  }
}
