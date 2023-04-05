import 'package:flutter/material.dart';
import 'package:mvvm/Screen/product/ViewProduct.dart';
import '../Models/Product.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../resources/UrlResources.dart';

class ProductProvider with ChangeNotifier
{

  List<Product>? alldata=[]; 
  bool isloading=false;
  
  getAllData(context) async
  {
    isloading=true;
    try
    {
        await ApiHandler.getRequest(UrlResources.VIEW_PRODUCT).then((json){
          alldata=json["data"].map<Product>((jsonobj)=>Product.fromJson(jsonobj)).toList();
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



  // Delete Data
  bool isdeleted=false;
  deleteProduct(context,params) async
  {
    isloading=true;
    try
    { 
        await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT,body: params).then((json){
            if(json["status"]=="true")
            {
                isdeleted=true;
            }
            else
            {
              isdeleted=false;
            }
            isloading=true;
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

  // Insert Data
  bool isinserted=false;
  var insertmessage="";
  insertProduct(context,params) async
  {
    isloading=true;
    try
    { 
       await ApiHandler.postRequest(UrlResources.ADD_PRODUCT,body: params).then((json){
            if(json["status"]=="true")
            {
              isinserted=true;
              insertmessage = json["message"].toString();
             
            }
            else
            {
              isinserted=false;
              insertmessage= json["message"].toString();
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



  Product? singleobj;

  getsingleproduct(context,params) async
  {
    isloading=true;
    try
    {
        await ApiHandler.postRequest(UrlResources.GET_SINGLE_PRODUCT,body: params).then((json){
          singleobj = Product.fromJson(json["data"]);
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


  // Update Product
  bool isupdated=false;
  var updatemessage="";
  updateProduct(context,params) async
  {
    isupdated=true;
    try
    { 
       await ApiHandler.postRequest(UrlResources.UPDATE_PRODUCT,body: params).then((json){
        if(json["status"]=="true")
        {
          isupdated=true;
          var message = json["message"].toString();
          print(message);
            
        }
        else
        {
          isupdated=false;
          var message = json["message"].toString();
          print(message);
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