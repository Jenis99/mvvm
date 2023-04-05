import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm/Screen/HomeScreen.dart';
import 'package:mvvm/Screen/auth/LogInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey("userid")){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>Homescreen())
      );

    }
    else{
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>LogInScreen())
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Wait for A Second!!"),
      ),
    );
  }
}