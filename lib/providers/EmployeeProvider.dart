

import 'package:flutter/material.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/helpers/ErrorHandler.dart';
import 'package:mvvm/models/Employee.dart';
import 'package:mvvm/resources/UrlResources.dart';

class EmployeeProvider with ChangeNotifier{
   List<Employee>alldata = [];
   bool isloading=false;
   allEmployee(context)async{
    isloading=true;
    await ApiHandler.getRequest(UrlResources.VIEW_EMPLOYEE).then((json){

       alldata=json["data"].map<Employee>((jsonobj)=>Employee.fromJson(jsonobj)).toList();
       notifyListeners();
    isloading=false;
  });
   }



  //  Insetdata
  bool isinserted=false;
  var insertmessage="";
  insertEmployee(context,params)async{
     isloading=true;
    try
    { 
    await ApiHandler.postRequest(UrlResources.ADD_EMPLOYEE).then((json){
      if(json["status"]=="true"){
        var insertmessage=json["message"].toString();
      }
      else{
        var insertmessage=json["message"].toString();
      }
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

  
  //  DeleteEmployee
  bool isdeleted=false;
  var deletemessage="";
  deleteEmployee(context,params)async{
     isdeleted=true;
    try
    { 
    await ApiHandler.postRequest(UrlResources.DELETE_EMPLOYEE,body: params).then((json){
      isdeleted=true;
      if(json["status"]=="true"){
        var deletemessage=json["message"].toString();
      }
      else{
        isdeleted=false;
        var deletemessage=json["message"].toString();
      }
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