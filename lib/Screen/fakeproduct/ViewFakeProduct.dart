import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/Screen/fakeproduct/ViewFakeProduct2.dart';
import 'package:mvvm/providers/FakeProductProvider.dart';
import 'package:provider/provider.dart';

class ViewFakeProduct extends StatefulWidget
{
  @override
  State<ViewFakeProduct> createState() => _ViewFakeProductState();
}

class _ViewFakeProductState extends State<ViewFakeProduct>
{
  FakeProductProvider? provider;

//200 ok
//400 api not found
//500 server error
   
  getdata() async
  {
      await provider!.getFakeProductdata(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      provider = Provider.of<FakeProductProvider>(context, listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<FakeProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("View Fake Product"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => ViewFakeProduct2())
            )
            );
          },  icon: Icon(Icons.add))
        ],
      ),
      body: 
      (provider!.isloading)?Center(child:CircularProgressIndicator()):ListView.builder(
        itemCount:provider!.allproducts.length,
        itemBuilder:(context,index){
          return ListTile(
            title: Text(provider!.allproducts[index].title.toString()),
            subtitle: Text(provider!.allproducts[index].category.toString()),
            trailing:Text(provider!.allproducts[index].price.toString())
          );
        }
      ),
      // FutureBuilder(

      //   future: allproducts,
      //   builder: (context,snapshot)
      //   {
      //     if(snapshot.hasData)
      //     {
      //       if(snapshot.data!.length<=0)
      //       {
      //         return Center(
      //           child: Text("No Data"),
      //         );
      //       }
      //       else
      //       {
      //         return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context,index)
      //           {
      //             return ListTile(
      //               leading: Image.network(snapshot.data![index]["image"].toString()),
      //               title: Text(snapshot.data![index]["title"].toString()),
      //               subtitle: Text(snapshot.data![index]["rating"]["rate"].toString()),
      //               trailing:  Text("Rs."+snapshot.data![index]["price"].toString()),
      //             );
      //           },
      //         );
      //       }
      //     }
      //     else
      //     {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      // body: Center(
      //   child:  ElevatedButton(onPressed: ()async{
      //      bool result = await InternetConnectionChecker().hasConnection;
      //     if(result == true) {
      //         print("Your Internet Is Conected");
      //       } else {
      //         print("Please Connect the Internet Connection");
      //       }
       
      //   }, child: Text("Menu")),
      // ),
    );
  }
}