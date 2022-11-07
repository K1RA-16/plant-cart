import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_cart/utils/dbStruct.dart';

class Db {
  static List<DbStruct> data = [];
  static List<dynamic> categories = [];
  static List<DbStruct> currentData = [];
}
