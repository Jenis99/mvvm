import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Screen/Product/ViewProduct.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';

import '../../Models/Product.dart';

class UpdateProduct extends StatefulWidget {
  var pid;
  UpdateProduct({required this.pid});
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
   TextEditingController _product=TextEditingController();
  TextEditingController _price=TextEditingController();
  TextEditingController _qty=TextEditingController();

  ProductProvider? provider;

  getdata()async{
   var params = {
    "pid":widget.pid
   };
   await provider!.getsingleproduct(context,params);
   _product.text = provider!.singleobj!.pname.toString();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
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
                                  "price":price,
                                  "pid":widget.pid,
                                };

                                await provider!.updateProduct(context, params);
                                if(provider!.isupdated){
                                   Navigator.of(context).pop();  
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>ViewProduct()
                                    )
                                  ); 
                                }
                              // Uri url=Uri.parse("http://picsyapps.com/studentapi/updateProductNormal.php");
                              //    var response = await http.post(url,body: params);
                              //   if(response.statusCode==200)
                              //   {
                              //     var json = jsonDecode(response.body.toString());
                              //     if(json["status"]=="true")
                              //     {
                              //       var message = json["message"].toString();
                              //       print(message);
                              //        Navigator.of(context).pop();  
                              //     Navigator.of(context).pop();
                              //     Navigator.of(context).push(
                              //       MaterialPageRoute(builder: (context)=>ViewProduct())
                              //     );  
                              //     }
                              //     else
                              //     {
                              //       var message = json["message"].toString();
                              //       print(message);
                              //     }
                              //   }
                                 
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                                child: Text("Update",style: TextStyle(
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