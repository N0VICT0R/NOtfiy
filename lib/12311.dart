//
//
// // import this Package in pubspec.yaml file
// // dependencies:
// //
// //   rounded_loading_button: ^1.0.0
//
// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
//
// class MyCustomWidget extends StatefulWidget {
// @override
// _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }
//
// class _MyCustomWidgetState extends State<MyCustomWidget> {
// final RoundedLoadingButtonController _btnController =
// new RoundedLoadingButtonController();
//
// void _doSomething() async {
// Timer(
// Duration(seconds: 3),
// () {
// _btnController.success();
// },
// );
// }
//
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// body: Center(
// child: RoundedLoadingButton(
// child: Text('Tap me!', style: TextStyle(color: Colors.white)),
// controller: _btnController,
// onPressed: _doSomething,
// ),
// ),
// );
// }
// RoundedLoadingButtonController _btnController =
// new RoundedLoadingButtonController();
//
// _doSomething() async {
//   Timer(Duration(seconds: 3), () {
//
//
//     if (confirmpassController.text != passwordController.text ||
//         confirmpassController.text.isEmpty ||
//         emailController.text.isEmpty) {
//       _btnController.error();
//
//
//     } else
//       _btnController.success();
//
//     signUp(emailController.text, passwordController.text, rool);
//   }
//
//   );
// }
// RoundedLoadingButton(
// color: Color.fromARGB(50, 2, 1, 50),
// errorColor: Colors.red,
// failedIcon: Icons.confirmation_num,
// child: Text('Register',
// style: TextStyle(color: Colors.white)),
// controller: _btnController,
// onPressed: _doSomething,
//
// ),
// }
//
//
//
//
//
//