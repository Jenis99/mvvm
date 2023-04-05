import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Screen/product/AddProduct2.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';
import '../../providers/ProductProvider.dart';
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}


class _AddProductState extends State<AddProduct> {
  TextEditingController _product=TextEditingController();
  TextEditingController _price=TextEditingController();
  TextEditingController _qty=TextEditingController();

   ProductProvider? provider;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.next_plan,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();  
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => AddProduct2())
        )); 
      },
    )
  ],
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


                                await provider!.insertProduct(context, params);
                                if(provider!.isinserted)
                                {
                                  print(provider!.insertmessage);
                                }
                                else
                                {
                                    print(provider!.insertmessage);
                                }

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