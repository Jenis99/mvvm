// import 'package:flutter/material.dart';

// import '../resources/StyleResources.dart';

// class PrimaryButton extends StatelessWidget
// {

//   var buttonText="";
//   var ctx;
//   GestureTapCallback onclick;
//   PrimaryButton({required this.buttonText,required this.ctx,required this.onclick});
//   @override
//   Widget build(Object context) {
//     return GestureDetector(
//           onTap: onclick,
//           child: Container(
//           margin: EdgeInsets.all(10.0),
//           width: MediaQuery.of(ctx).size.width,
//           height: 60.0,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: StyleResources.PrimaryColor,
//             borderRadius: BorderRadius.circular(15.0)
//           ),
//           child: Text(buttonText,style: TextStyle(fontSize: 20.0,color: Colors.white),),
//         ),
//         );
//   }

// }