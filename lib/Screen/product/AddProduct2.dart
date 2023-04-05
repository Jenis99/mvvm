import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/resources/UrlResources.dart';
class AddProduct2 extends StatefulWidget {
  const AddProduct2({super.key});

  @override
  State<AddProduct2> createState() => _AddProduct2State();
}


class _AddProduct2State extends State<AddProduct2> {
  TextEditingController _product=TextEditingController();
  TextEditingController _price=TextEditingController();
  TextEditingController _qty=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product 2"),
      ),

      body: SingleChildScrollView(
          child: (
              Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0,),
                            Text("Product Name",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _product,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Price",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _price,
                              keyboardType: TextInputType.number,
                            ),
                            
                            Text("Qty",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _qty,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                           
                            Center(
                              child:  ElevatedButton(
                                onPressed: () async{
                                var name=_product.text.toString();
                                var price=_price.text.toString();
                                var qty=_qty.text.toString();

                               

                                var params = {
                                  "pname":name,
                                  "qty":qty,
                                  "price":price
                                };


                                await ApiHandler.postRequest(UrlResources.ADD_PRODUCT,body: params).then((json){
                                    if(json["status"]=="true")
                                    {
                                      var message = json["message"].toString();
                                      print(message);
                                    }
                                    else
                                    {
                                      var message = json["message"].toString();
                                      print(message);
                                    }
                                });

                                // Uri url = Uri.parse("http://picsyapps.com/studentapi/insertProductNormal.php");

                                // var response = await http.post(url,body: params);
                                // if(response.statusCode==200)
                                // {
                                //   var json = jsonDecode(response.body.toString());
                                //   if(json["status"]=="true")
                                //   {
                                //     var message = json["message"].toString();
                                //     print(message);
                                //   }
                                //   else
                                //   {
                                //     var message = json["message"].toString();
                                //     print(message);
                                //   }
                                // }
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                                child: Text("Add",style: TextStyle(
                                    fontSize: 20.0
                                ),),
                              )),
                            )
                          ],
                        )
                    ),
                  ]
              )
          )
      ),
    );
  }
}