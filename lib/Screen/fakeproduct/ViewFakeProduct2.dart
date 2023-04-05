import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Screen/fakeproduct/ViewFakeProduct2.dart';
import 'package:mvvm/providers/FakeProductProvider.dart';
import 'package:provider/provider.dart';

class ViewFakeProduct2 extends StatefulWidget
{
  @override
  State<ViewFakeProduct2> createState() => _ViewFakeProduct2State();
}

class _ViewFakeProduct2State extends State<ViewFakeProduct2>
{
  FakeProductProvider? provider;

//200 ok
//400 api not found
//500 server erro


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      provider = Provider.of<FakeProductProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<FakeProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Fake Product"),
      ),
      body: 
      ListView.builder(
        itemCount:provider!.allproducts.length,
        itemBuilder:(context,index){
          return ListTile(
            title: Text(provider!.allproducts[index].title.toString()),
            subtitle: Text(provider!.allproducts[index].category.toString()),
            trailing:Text(provider!.allproducts[index].price.toString())
          );
        }
      ),
    );
  }
}