import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm/providers/AuthProvider.dart';
import '../../providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../utility/HexColor.dart';

class Showuserdata extends StatefulWidget {
  const Showuserdata({super.key});

  @override
  State<Showuserdata> createState() => _ShowuserdataState();
}


class _ShowuserdataState extends State<Showuserdata> {
   AuthProvider? provider;


  getdata()async{
       await provider?.getuserdata(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
    getdata();
     
  }
  @override
  Widget build(BuildContext context) {
    provider= provider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      body:(provider!.isloading)?Center(child: CircularProgressIndicator()):  
      ListView.builder(
        itemCount: provider!.alldata.length,
        itemBuilder: ((context, index) {
          Color clr = HexColor(provider!.alldata[index].color.toString());
          return Container(
            child: Card(
              color: clr,
              child: Column(
                children: [
                  Image.network(provider!.alldata[index].categoryImage.toString(),width: 200.0,),
                  SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Comment :"+provider!.alldata[index].totalComments.toString(),style: TextStyle(
                      fontSize: 20.0
                    ),),
                Text(" Like :"+provider!.alldata[index].totalLike.toString(),style: TextStyle(
                      fontSize: 20.0
                    ),),
                // Text("data"),
                  ],
                ),
                ],
              ),
            ),
          );
      }),
      )
    );
  }
}