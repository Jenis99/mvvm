import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget
{
  var hinttext = "";
  TextEditingController? controller;
  TextInputType? keyboard;

  MyTextBox({required this.hinttext,required this.controller,required this.keyboard});
  @override
  Widget build(BuildContext context) {
    return TextField(
            decoration: InputDecoration (
              hintText: hinttext,
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Colors.blue ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide:BorderSide(color: Colors.black),
              ),
            ),
            controller: controller,
            keyboardType: keyboard,
          );
  }

}