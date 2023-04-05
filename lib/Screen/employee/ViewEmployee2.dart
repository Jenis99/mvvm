import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Models/Employee.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/providers/EmployeeProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';

class ViewEmployee2 extends StatefulWidget {
  const ViewEmployee2({super.key});

  @override
  State<ViewEmployee2> createState() => _ViewEmployee2State();
}

class _ViewEmployee2State extends State<ViewEmployee2> {

  EmployeeProvider? provider;

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider=Provider.of<EmployeeProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("View Employee Using Model"),
      ),
      body:(provider!.isloading)?Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount:provider!.alldata.length,
        itemBuilder:(context,index){
          return ListTile(
            title: Text(provider!.alldata[index].ename.toString()),
            subtitle: Text(provider!.alldata[index].department.toString()),
            trailing:Text(provider!.alldata[index].salary.toString())
          );
        }
      ),
    );
  }
}