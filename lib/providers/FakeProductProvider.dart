import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/models/Employee.dart';
import 'package:mvvm/models/FakeProduct.dart';
import 'package:mvvm/models/Product.dart';
import 'package:mvvm/resources/UrlResources.dart';

class FakeProductProvider with ChangeNotifier{
  List<FakeProduct>allproducts = [];
  bool  isloading=false;

  getFakeProductdata(context)async{
     isloading=true;
    await ApiHandler.getRequest(UrlResources.VIEW_FAKE_PRODUCT).then((json){
          allproducts=json.map<FakeProduct>((jsonobj)=>FakeProduct.fromJson(jsonobj)).toList();
          notifyListeners();
          isloading=false;
      });
  }
}