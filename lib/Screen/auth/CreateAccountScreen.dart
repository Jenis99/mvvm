import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
   TextEditingController _email=TextEditingController();    
  TextEditingController _password=TextEditingController();    
  TextEditingController _confirm=TextEditingController();    
  TextEditingController _name=TextEditingController();    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create account"),
      ),
      body: Column(children: [
        TextField(
            decoration: InputDecoration (
              hintText: 'Enter Your Name',
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.blue ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide:BorderSide(color: Colors.black),
              ),
            ),
            controller: _name,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10.0,),
        TextField(
            decoration: InputDecoration (
              hintText: 'Enter Your Email',
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.blue ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide:BorderSide(color: Colors.black),
              ),
            ),
            controller: _email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.0,),
           TextField(
            decoration: InputDecoration (
              hintText: 'Create Password',
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
           TextField(
            decoration: InputDecoration (
              hintText: 'Confirm Password',
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.blue ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide:BorderSide(color: Colors.black),
              ),
            ),
            controller: _confirm,
            keyboardType: TextInputType.visiblePassword,
          ),
          ElevatedButton(onPressed: (){

          }, child: Text("Create"))
      
      ]),
    );
  }
}