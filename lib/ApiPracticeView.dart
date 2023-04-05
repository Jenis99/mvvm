import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Models/Product.dart';
import 'package:mvvm/models/ApiPractice.dart';

class ApiPracticeView extends StatefulWidget {
  const ApiPracticeView({super.key});

  @override
  State<ApiPracticeView> createState() => _ApiPracticeViewState();
}

class _ApiPracticeViewState extends State<ApiPracticeView> {

  List<ApiPractice> alldata=[];
  
   getdata()async{
    Uri url=Uri.parse("https://pokeapi.co/api/v2/pokemon");
    var response=await http.get(url);
    if(response.statusCode==200){
      var body = response.body.toString();
      var json=jsonDecode(body);
      setState(() {
        alldata=json["results"].map<ApiPractice>((jsonobj)=>ApiPractice.fromJson(jsonobj)).toList();
      });

          alldata.map((obj) async{
            Uri url=Uri.parse(obj.url.toString());
            var response=await http.get(url);
          });
         }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: alldata!.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(alldata![index].name.toString()),
            subtitle:Text(alldata![index].url.toString()),
          );
        }),
    );
  }
}