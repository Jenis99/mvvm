import 'package:flutter/material.dart';
import 'package:mvvm/Screen/Showgames.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/models/Games.dart';
import 'package:mvvm/models/Gamestypes.dart';
import 'package:mvvm/resources/UrlResources.dart';

import '../helpers/ErrorHandler.dart';

class GamesProvider extends ChangeNotifier{
  List<Gamestypes>alldata = [];
  List<Games>alldata1 = [];
  bool isloading=false;
   gettypesdata(context)async{
    var result="";
    // var jsonobj;
     isloading=true; 
    try
    {
        await ApiHandler.getRequest(UrlResources.GETGAME)
        .then((json){
          print("json");
          
             alldata=json["gametype"].map<Gamestypes>((jsonobj)=>Gamestypes.fromJson(jsonobj)).toList();
             alldata1=json["games"].map<Games>((jsonobj)=>Games.fromJson(jsonobj)).toList();
            //  + json.map<Games>((jsonobj)=>Games.fromJson(jsonobj)).toList();
           notifyListeners();
          isloading=false;
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
   }


}