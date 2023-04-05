import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm/Screen/auth/CreateAccountScreen.dart';
import 'package:mvvm/Screen/HomeScreen.dart';
import 'package:provider/provider.dart';
import '../../providers/AuthProvider.dart';
import '../../widgets/MyTextBox.dart';

class LogInScreen extends StatefulWidget {

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _name=TextEditingController();    
  TextEditingController _password=TextEditingController();    

  AuthProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     provider = Provider.of<AuthProvider>(context, listen: false);
  }

  _loginform()
  {
    return  Column(children: [
         SizedBox(height: 10.0,),
         MyTextBox(

          
          hinttext: 'Enter Your Name',

          
          controller: _name,

          
          keyboard: TextInputType.emailAddress,
         ),
        //  TextField(
        //     decoration: InputDecoration (
        //       hintText: 'Enter Your Name',
        //       focusedBorder: OutlineInputBorder(
        //         borderSide:BorderSide(color: Colors.blue ),
        //       ),
        //       enabledBorder:  OutlineInputBorder(
        //         borderSide:BorderSide(color: Colors.black),
        //       ),
        //     ),
        //     controller: _name,
        //     keyboardType: TextInputType.emailAddress,
        //   ),
          SizedBox(height: 10.0,),
           TextField(
            decoration: InputDecoration (
              hintText: 'Enter Your Password',
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.blue ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide:BorderSide(color: Colors.black),
              ),
            ),
            controller: _password,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 10.0,),
            _loginbtn(),
          GestureDetector(
            onTap: (){
             
            },
            child: Text("Create an Account "),

          )
      ]);
  }
  _loginbtn()
  {
    return  ElevatedButton(onPressed: () async{
        var name = _name.text.toString();
        var password = _password.text.toString();
        var params = {
          "name": name,
          "password": password,
          "device_token":"12345678",
          "device_os":"android" // flutter current OS
        };
        await provider!.checklogin(context,params);
        if(provider!.result=="success")
        {
          print("Login SuccessFull");
          Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => Homescreen()))
          );
        }
        else
        {
          print("Login Failed!");
        }
      }, child: Text("Log In"));
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: _loginform(),
    );
  }
}