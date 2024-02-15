// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
//
// import '../model/datamodel.dart';
//
// Future<List<ProductDataModel>>ReadJsonData() async{
//   final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
//   final list = json.decode(jsondata) as List<dynamic>;
//
//   return list.map((e) => ProductDataModel.fromJson(e)).toList();
// }