import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Models/Product.dart';
import 'package:mvvm/Screen/product/UpdateProduct.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/helpers/ErrorHandler.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';
class ViewProduct2 extends StatefulWidget {
  const ViewProduct2({super.key});

  @override
  State<ViewProduct2> createState() => _ViewProduct2State();
}

class _ViewProduct2State extends State<ViewProduct2> {
  ProductProvider? provider;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: (provider!.isloading)?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: provider!.alldata!.length,
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
               children:[
                Text(provider!.alldata![index].pname.toString()),
                Text(provider!.alldata![index].price.toString()),
                Text(provider!.alldata![index].qty.toString()),
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
                        var id = provider!.alldata![index].pid.toString();
                        var params={
                        "pid":id
                        };
                        await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT,body: params).then((json){
                        if(json["status"]=="true")
                        {
                            Navigator.of(context).pop();
                             
                        }
                        else{
                          print("object");
                        }
                        });
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
                ElevatedButton(onPressed: (){
                    var id = provider!.alldata![index].pid.toString();
                   
                }, child: Text("Edit")),
                
                  ],
                )
               ]
            ),
          );
        }),
    );
  }
}