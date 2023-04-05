import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm/providers/GamesProvider.dart';
import 'package:provider/provider.dart';

class Showgames extends StatefulWidget {
  const Showgames({super.key});

  @override
  State<Showgames> createState() => _ShowgamesState();
}

class _ShowgamesState extends State<Showgames> {
  GamesProvider? provider;

  loadgames()async{
    await provider?.gettypesdata(context);
     

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider=Provider.of<GamesProvider>(context,listen: false);
    loadgames();
  }
  @override
  Widget build(BuildContext context) {
    provider: provider=Provider.of<GamesProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Games")
      ),
      body: (provider!.isloading)?Center(child: CircularProgressIndicator()):
      Column(
        children: [
          Container(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:provider!.alldata.length,
                  itemBuilder:(context,index)
                  {
                    return Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(color: Colors.amber.shade50,
                      // shape:BoxShape.circle
                      ),
                      
                      child: Column(children: [
                        Text(provider!.alldata[index].typeName.toString(),
                        style: TextStyle(
                          fontSize:20.0
                        ),),
                        Text(provider!.alldata[index].typeId.toString(),
                        style: TextStyle(
                          fontSize:20.0
                        ),),
                        Text(provider!.alldata[index].position.toString(),
                        style: TextStyle(
                          fontSize:20.0
                        ),),
                        Text(provider!.alldata[index].isactive.toString(),
                        style: TextStyle(
                          fontSize:20.0
                        ),),
                      ]),
                      // title: Text(provider!.alldata![index].typeName.toString()),
                      // subtitle: Text(provider!.alldata![index].typeId.toString()),
                );
                }
                )
          ),
          SizedBox(height: 20.0,),
          Expanded(
            child: ListView.builder(
              itemCount:provider!.alldata1.length,
                  itemBuilder:(context,index){
                    return ListTile(
                    title: Text(provider!.alldata1[index].startname.toString()),
                    subtitle: Text(provider!.alldata1[index].time.toString()),
                    trailing: Text(provider!.alldata1[index].gameId.toString()),
                  );
                  }
              )
          ),      
        ],
      )
      //  ListView.builder(
        // itemCount:provider!.alldata.length,
        // itemBuilder:(context,index){
        //   return Column(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.all(10.0),
        //         padding: EdgeInsets.all(10.0),
        //         decoration: BoxDecoration(color: Colors.lightBlue.shade100),
        //         child: Row(
        //           mainAxisAlignment:MainAxisAlignment.spaceBetween,
        //           children: [
        //            Container(
        //                 child: Column(children: [
        //                   Text("Game Type Data"),
        //                   SizedBox(height: 20.0,),
        //                   Text(provider!.alldata[index].typeName.toString()),
        //                   Text(provider!.alldata[index].typeId.toString()),
        //                 ]
        //                 ),
        //            ),
        //            Container(
        //                 child: Column(children: [
        //                   Text("Game Data"),
        //                    SizedBox(height: 20.0,),
        //                   Text(provider!.alldata1[index].startname.toString()),
        //                   Text(provider!.alldata1[index].time.toString()),
        //                 ]
        //                 ),
        //            ),
        //         ],),
        //       ),




              // Container(
              //   height: 250.0,
              //   child: ListView(
              //     scrollDirection:Axis.horizontal,
              //     children: [
              //       Container(
              //         child: Column(children: [
              //           Text(provider!.alldata[index].typeName.toString()),
              //           Text(provider!.alldata[index].typeId.toString()),
              //         ]),
              //         // title: Text(provider!.alldata![index].typeName.toString()),
              //         // subtitle: Text(provider!.alldata![index].typeId.toString()),
              //   ),
              //     ]
              //       )
              //       ),
              //     SizedBox(height: 20.0,),
              //     ListTile(
              //       title: Text(provider!.alldata1[index].startname.toString()),
              //       subtitle: Text(provider!.alldata1[index].time.toString()),
              //       trailing: Text(provider!.alldata1[index].gameId.toString()),
              //     )
              //     ],
              //   );
              //   }
              // )
          );
        }
  }