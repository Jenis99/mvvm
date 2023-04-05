import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Models/Employee.dart';
import 'package:mvvm/Screen/employee/UpdateEmployee.dart';
import 'package:mvvm/Screen/employee/ViewEmployee2.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/providers/EmployeeProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {

  EmployeeProvider? provider;

  getemployee_data()async{

    await provider!.allEmployee(context);

    // Uri url=Uri.parse("http://picsyapps.com/studentapi/getEmployee.php");
    // var response=await http.get(url);
    // if(response.statusCode==200){
    //   var body=response.body.toString();
    //   var json = jsonDecode(body);
    //  setState(() {
    //    alldata=json["data"].map<Employee>((jsonobj)=>Employee.fromJson(jsonobj)).toList();
    //  });
    // }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider=Provider.of<EmployeeProvider>(context,listen: false);
    getemployee_data();
  }
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("View Employee Using Model"),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ViewEmployee2())
          );
        }, icon: Icon(Icons.add))
      ],
      ),
      body:(provider!.isloading)?Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount:provider!.alldata.length,
        itemBuilder:(context,index){
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
               children:[
                Text(provider!.alldata![index].ename.toString()),
                Text(provider!.alldata![index].gender.toString()),
                Text(provider!.alldata![index].salary.toString()),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    ElevatedButton(
                  onPressed: (){
                    print("object");
                    AlertDialog alert =  AlertDialog(
                    title: Text("Warning!"),
                    content: Text("Are you sure you want to delete?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () async{
                        var id = provider!.alldata![index].eid.toString();
                        var params={
                        "eid":id
                        };
                        await provider!.deleteEmployee(context,params);
                        if(provider!.isdeleted)
                        {
                            await provider!.allEmployee(context);
                            Navigator.of(context).pop();
                        }
                       
                      }, child: Text("Yes")),
                      ElevatedButton(
                        onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("No")),
                      
                    ],
                  );
                    showDialog(context: context, builder: (context){
                    return alert;
                  });
                }, child: Text("Delete")
                ),
                SizedBox(width: 20.0,),
                ElevatedButton(
                  onPressed: (){
                    var id = provider!.alldata![index].eid.toString();
                    var employee = provider!.alldata![index].ename.toString();
                    var salary = provider!.alldata![index].salary.toString();
                    var department = provider!.alldata![index].department.toString();
                    var gender = provider!.alldata![index].gender.toString();
                    var obj=provider!.alldata![index];
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateEmployee(
                      obj: obj,
                    ))
                  );
                }, child: Text("Edit")),
                
                  ],
                )
               ]
            ),
          );
          // return ListTile(
          //   title: Text(provider!.alldata[index].ename.toString()),
          //   subtitle: Text(provider!.alldata[index].department.toString()),
          //   trailing:Text(provider!.alldata[index].salary.toString()),

          // );
        }
      ),
    );
  }
}