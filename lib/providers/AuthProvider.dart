import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm/Screen/Showuserdata.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../models/Userdata.dart';
import '../resources/UrlResources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier
{
   List<Userdata>alldata = [];
    bool isloading=false;
    var result="";
   checklogin(context,params) async
   {
     isloading=true;
    var headers ={
      "Content-Type":"application/json"
    };
     SharedPreferences prefs = await SharedPreferences.getInstance();
    
    try
    {
        await ApiHandler.postRequest(UrlResources.LOGIN_URL,body: jsonEncode(params),headers: headers)
        .then((json){
          result= json["result"];
          if(result=="success")
          {
           var id = json["data"]["id"].toString();
          var name = json["data"]["name"];
          var email = json["data"]["email"];
          var token = json["data"]["user_session_token"];

          // Save in local storage by sharedprefrence 

          prefs.setString("userid", id);
          prefs.setString("username", name);
          prefs.setString("token", token);
          prefs.setString("email", email);
         
          }
         
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


   getuserdata(context)async{
     isloading=true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    var token=prefs.getString("token").toString();
    var headers={
      "user_session_token": token,
      "Content-Type":"application/json",
    };
      var params={
            "user_id": prefs.getString("userid").toString(),
            "page": "1"
      };
    
    try
    {
        await ApiHandler.postRequest(UrlResources.GETUSERDATA,body: jsonEncode(params),headers: headers)
        .then((json){
          print("json");
          result= json["result"];
          if(result=="success"){
             alldata=json["data"].map<Userdata>((jsonobj)=>Userdata.fromJson(jsonobj)).toList(); 
          }
           notifyListeners();
          // if(result=="success")
          // {
          //  var id = json["data"]["id"].toString();
          //  var userid = json["data"]["id"].toString();
          // var name = json["data"]["name"];
          // var color = json["data"]["color"];
          // var email = json["data"]["email"];
          // var categoryimage = json["data"]["category_image"].toString();
          // print(id+name+email);
          // // Save in local storage by sharedprefrence 
          // prefs.setString("id1", id);
          // prefs.setString("userid1", userid);
          // prefs.setString("color", color);
          // prefs.setString("email1", email);
          // prefs.setString("image", categoryimage);
          // }
         
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