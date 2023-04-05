import 'package:flutter/material.dart';
import 'package:mvvm/ApiPracticeView.dart';
import 'package:mvvm/Screen/Employee/AddEmployee.dart';
import 'package:mvvm/Screen/Employee/ViewEmployee.dart';
import 'package:mvvm/Screen/ShowUserdata.dart';
import 'package:mvvm/Screen/Showgames.dart';
import 'package:mvvm/Screen/auth/LogInScreen.dart';
import 'package:mvvm/Screen/fakeproduct/ViewFakeProduct.dart';
import 'package:mvvm/Screen/product/AddProduct.dart';
import 'package:mvvm/Screen/product/ViewProduct.dart';
import 'package:mvvm/models/ApiPractice.dart';
import '../resources/StringResources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {



  var username="";
  var useremail="";
   

  setdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username=prefs.getString("username").toString();
      useremail=prefs.getString("email").toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdata();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:  ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
       DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [
            Text(username),
            SizedBox(height: 10.0,),
            Text(useremail),
          ],
        ),
      ),
      ListTile(
        title: const Text('Add Product'),
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>AddProduct())
         );
        },
      ),
      ListTile(
        title: const Text('View Product'),
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ViewProduct())
         );
        },
      ),
      ListTile(
        title: const Text('Add Employee'),
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>AddEmployee())
         );
        },
      ),
      ListTile(
        title: const Text('View Employee'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ViewEmployee())
         );
        },
      ),
      ListTile(
        title: const Text('View Fake Product'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ViewFakeProduct())
         );
        },
      ),
      ListTile(
        title: const Text('Api Practice'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ApiPracticeView())
         );
        },
      ),
      ListTile(
        title: const Text('Get User data '),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Showuserdata())
         );
        },
      ),
      ListTile(
        title: const Text('Show Games'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Showgames())
         );
        },
      ),
      ElevatedButton(onPressed: ()async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.clear();

       Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => LogInScreen())
       ));

      }, child: Text("Log Out"))
    ],
  ),
      ),
    appBar: AppBar(
      title: Text("Home Screen"),
    ),
    body: Center(
      child: Text("This is Homescreen!!"),
    ),
    );
  }
}