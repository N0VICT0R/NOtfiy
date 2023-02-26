import 'dart:async';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

// import 'compunant.dart';
import 'Moaz wahba.dart';
import 'login (2).dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool _isObscure = true;
  final bool _isObscure2 = true;
  File? file;
  var options = [
    'Student',
    'Teacher',
  ];
  var currentItemSelected = "Student";
  var rool = "Student";

  @override
  Widget build(BuildContext context) {
    var selectedValue;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 17, left: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: InkWell(

                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: _buildImage('flutter.png', 100),
              ),
            ),
          ),
        ],
      ),
      // backgroundColor: const Color.fromRGBO(26, 95, 195, 1.0),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fullscreen.jpg"),
                    fit: BoxFit.cover),
              ),
              // color: const Color.fromRGBO(26, 95, 195, 1.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 150,
                            ),
                            const Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 90,
                            ),
                            // CustomDropDown(
                            //   dropdownColor: Colors.blue,
                            //   value: selectedValue,
                            //   itemsList: ['teacher','student'],
                            //
                            //   onChanged: (value){
                            //     setState(() {
                            //       selectedValue=value;
                            //     });
                            //   },
                            // ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(50, 2, 1, 50),
                                hintText: 'Register AS',
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              dropdownColor: Color.fromARGB(100, 19, 19, 28),
                              isDense: true,
                              isExpanded: true,
                              iconEnabledColor: Colors.white,
                              focusColor: Colors.white,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold

                                        // fontSize: 20,
                                        ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  currentItemSelected = newValueSelected!;
                                  rool = newValueSelected;
                                });
                              },
                              value: currentItemSelected,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(50, 2, 1, 50),
                                label: Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please enter a valid email");
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: _isObscure,
                              controller: passwordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                filled: true,
                                fillColor: Color.fromARGB(50, 2, 1, 50),
                                label: Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("please enter valid password min. 6 character");
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: _isObscure2,
                              controller: confirmpassController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(50, 2, 1, 50),
                                label: Text(
                                  'Confirm Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                enabled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (confirmpassController.text !=
                                    passwordController.text) {
                                  return "Password did not match";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedLoadingButton(
                                  // color: Color.fromARGB(50, 2, 1, 50),
                                  color: Colors.black,
                                  errorColor: Colors.red,
                                  successColor: Colors.green[800],
                                  failedIcon: Icons.close,
                                  child: Text('Register',
                                      style: TextStyle(color: Colors.white)),
                                  controller: _btnController,
                                  onPressed: _doSomething,

                                ),
                                // ElevatedButton(
                                //   style: ButtonStyle(
                                //       backgroundColor:
                                //           MaterialStateProperty.all<Color>(
                                //         Color.fromARGB(50, 2, 1, 50),
                                //       ),
                                //       shape: MaterialStateProperty.all<
                                //               RoundedRectangleBorder>(
                                //           RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(18.0),
                                //               side: BorderSide(
                                //                   color: Colors.white)))),
                                //   onPressed: () {
                                //     setState(() {
                                //       showProgress = true;
                                //     });
                                //     signUp(emailController.text,
                                //         passwordController.text, rool);
                                //   },
                                //   child: const Text(
                                //     "   Register   ",
                                //     style: TextStyle(
                                //       fontSize: 20,
                                //     ),
                                //   ),
                                // ),
                                // MaterialButton(
                                //   shape: const RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.all(
                                //           Radius.circular(20.0))),
                                //   elevation: 5.0,
                                //   height: 40,
                                //   onPressed: () {
                                //     const CircularProgressIndicator();
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => LoginPage(),
                                //       ),
                                //     );
                                //   },
                                //   color: Colors.white,
                                //   child: const Text(
                                //     "  Login ",
                                //     style: TextStyle(
                                //       fontSize: 20,
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                            curve: Curves.bounceInOut,
                            speed: const Duration(microseconds: 555000),
                            'Copyrights @',
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(26, 95, 195, 1.0),
                              fontSize: 10,
                            )),
                      ],
                    ),
                    const Text(
                      ""
                      "<Moaz Wahba/\> <Abdalrahman Adel/\> <Ahmed Mohamed/\> <Mohmed Ali*/\> <Mohmed Adel/\>  ",
                      style: TextStyle(fontSize: 8.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signUpWithUsernameAndPassword(email, password) async {
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      if (user != null) {
        showMsg('UserId: ${cred.user!.email} \n'
            'Email verified: ${cred.user!.emailVerified}\n'
            'Last time: ${cred.user!.metadata.lastSignInTime}');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMsg('Password is weak');
      } else if (e.code == 'email-already-in-use') {
        showMsg('Email already exist');
      }
    } catch (e) {
      showMsg('Error happened');
    }
  }

  void signUp(String email, String password, String rool) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': emailController.text, 'rool': rool});

    Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginPage()))
        .then((value) => showMsg("hello $rool"));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
        msg,
        style: TextStyle(
          fontSize: 26,
        ),
      )),
    );
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  _doSomething() async {
    Timer(Duration(seconds: 3), () {


      if (confirmpassController.text != passwordController.text ||
          confirmpassController.text.isEmpty ||
          emailController.text.isEmpty) {
        _btnController.error();
        Future.delayed(const Duration(milliseconds: 600), () {

// Here you can write your code

          setState(() {
           _btnController.reset();
          });

        });


      } else if (confirmpassController.text == passwordController.text ||
          confirmpassController.text.isNotEmpty ||
          emailController.text.isNotEmpty){

        _btnController.success();

        signUp(emailController.text, passwordController.text, rool);
      }

    });
  }
}
