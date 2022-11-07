import 'package:flutter/material.dart';

import '../utils/db.dart';

class DescriptionViewModel extends ChangeNotifier {
  String name = "";
  double price = 0.0;
  String description = "";
  String photo = "";
  String height = "";
  String pot = "";
  String temperature = "";

  selectPlant(index) {
    print(Db.currentData[index]);
    name = Db.currentData[index].name;
    photo = Db.currentData[index].photo;
    description = Db.currentData[index].instructions;
    price = Db.currentData[index].price;
    pot = Db.currentData[index].pot;
    height = Db.currentData[index].height;
    temperature = Db.currentData[index].temperature;
    notifyListeners();
  }
}
