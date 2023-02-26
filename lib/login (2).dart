import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notify/register.dart';
import 'package:notify/student.dart';
import 'package:notify/teacher.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'admin.dart';
import 'moazwahba.dart';

//
// import 'Student.dart';
// import 'Teacher.dart';
// import 'admin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;

  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  signInWithUsernameAndPassword(email, password) async {
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        showMsg('Hi ${cred.user!.email}');
        if (user != null) {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          route();
        }
        if (emailController.text == 'admin1@gmail.com' &&
            passwordController.text == '123456') {
          showMsg("Hello Admin ");
        }
      }
    } catch (e) {
      showMsg("Please Enter Valid Data And Try Again");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        leading: const Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 17, left: 10),
              child: InkWell(
                  child: Text(
                '',
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            child: Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16),
                  child: _buildImage('flutter.png', 100),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/fullscre1en.jpg',
                    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.fitHeight,
                  ),
                ),
                // Container(
                // decoration: const BoxDecoration(
                //   image: DecorationImage(image: NetworkImage("https://www.google.com/search?q=notify&client=ms-android-xiaomi-rev1&prmd=inv&sxsrf=ALiCzsY5cQ5bAaocyY9d7x8Y8wHDtBvkRQ:1672071405350&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjltJ6x15f8AhU4TaQEHfk4Cx8Q_AUoAXoECAIQAQ#imgrc=pqBCtGCoaJjtJM"),fit: BoxFit.cover),
                //              // ),
                //         decoration: const BoxDecoration(
                //         image: DecorationImage(
                //         image: AssetImage("assets/fullscreen.jpg"),
                //           fit: BoxFit.cover),
                // ),
                //
                //               width: MediaQuery.of(context).size.width,
                //               height: MediaQuery.of(context).size.height,
                // child:
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: SizedBox(
                        width: size.width * .9,
                        height: size.height * .8,
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          child: Form(
                            key: _formkey,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 100.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          const Text(
                                            "Login",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 40,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Visibility(
                                              maintainSize: true,
                                              maintainAnimation: true,
                                              maintainState: true,
                                              visible: visible,
                                              child:
                                                  const CircularProgressIndicator(
                                                color: Colors.white,
                                              )),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor:
                                                  Color.fromARGB(3, 2, 1, 50),
                                              label: Text('Email',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              enabled: true,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 8.0,
                                                      top: 8.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                            onSaved: (value) {
                                              emailController.text = value!;
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: passwordController,
                                            obscureText: _isObscure3,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  icon: Icon(
                                                      _isObscure3
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      color: Colors.white),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isObscure3 =
                                                          !_isObscure3;
                                                    });
                                                  }),
                                              filled: true,
                                              fillColor:
                                                  Color.fromARGB(3, 2, 1, 100),
                                              label: Text(
                                                'Password',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              enabled: true,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 8.0,
                                                      top: 15.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                            onSaved: (value) {
                                              passwordController.text = value!;
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              RoundedLoadingButton(
                                                // color: Color.fromARGB(50, 2, 1, 50),
                                                color: Colors.black,
                                                errorColor: Colors.red,
                                                successColor: Colors.green[800],
                                                failedIcon: Icons.close,
                                                child: Text('Login',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                controller: _btnController,
                                                onPressed: _doSomething,
                                              ),

                                              // ElevatedButton(
                                              //     style: ButtonStyle(
                                              //         backgroundColor:
                                              //             MaterialStateProperty
                                              //                 .all<Color>(
                                              //               Colors.black
                                              //           // Color.fromARGB(
                                              //           //     50, 2, 1, 50),
                                              //         ),
                                              //         shape: MaterialStateProperty.all<
                                              //                 RoundedRectangleBorder>(
                                              //             RoundedRectangleBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             18.0),
                                              //                 side: BorderSide(
                                              //                     color: Colors
                                              //                         .black)))),
                                              //     onPressed: () async {
                                              //       if (emailController
                                              //                   .text ==
                                              //               'admin1@gmail.com' &&
                                              //           passwordController
                                              //                   .text ==
                                              //               '123456') {
                                              //         showMsg('HEllo Admin');
                                              //         // Navigator.pushReplacement(
                                              //         //   context,
                                              //         //   MaterialPageRoute(
                                              //         //     builder: (context) =>
                                              //         //         AdminPage(),
                                              //         //   ),
                                              //         // );
                                              //       } else if (emailController
                                              //               .text !=
                                              //           'admin1@gmail.com') {
                                              //         signInWithUsernameAndPassword(
                                              //           emailController.text,
                                              //           passwordController
                                              //               .text,
                                              //         );
                                              //       } else {
                                              //         signInWithUsernameAndPassword(
                                              //           emailController.text,
                                              //           passwordController
                                              //               .text,
                                              //         );
                                              //       }
                                              //     },
                                              //     child: Text(
                                              //       '      Login     ',
                                              //       style: TextStyle(
                                              //         fontSize: 20,
                                              //       ),
                                              //     )),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              // SizedBox(
                                              //   height: 50.0,
                                              // ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    height: 2,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  Text(
                                                    "  OR  ",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    height: 2,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              OpenContainer(
                                                closedBuilder:
                                                    (_, openContainer) {
                                                  return Container(
                                                    height: 60,
                                                    width: 150,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty.all<
                                                                      Color>(
                                                                  Colors.black
                                                                  // Color.fromARGB(
                                                                  //     50, 2, 1, 50),
                                                                  ),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .black)))),
                                                      onPressed: () {
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Register(),
                                                          ),
                                                        );
                                                      },
                                                      child: const Text(
                                                        "   Register   ",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    // IconButton(
                                                    //   splashColor: Colors.transparent,
                                                    //   highlightColor: Colors.transparent,
                                                    //   onPressed: openContainer,
                                                    //   icon: Icon(
                                                    //     Icons.settings,
                                                    //     size: 30,
                                                    //     color: Colors.black.withOpacity(0.8),
                                                    //   ),
                                                    // ),
                                                  );
                                                },
                                                openColor: Colors.white,
                                                closedElevation: 55.0,
                                                closedShape:
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                closedColor: Colors.white,
                                                openBuilder:
                                                    (_, closeContainer) {
                                                  return Register();
                                                },
                                              ),
                                              // ElevatedButton(
                                              //   style: ButtonStyle(
                                              //       backgroundColor:
                                              //           MaterialStateProperty
                                              //               .all<Color>(
                                              //             Colors.black
                                              //         // Color.fromARGB(
                                              //         //     50, 2, 1, 50),
                                              //       ),
                                              //       shape: MaterialStateProperty.all<
                                              //               RoundedRectangleBorder>(
                                              //           RoundedRectangleBorder(
                                              //               borderRadius:
                                              //                   BorderRadius
                                              //                       .circular(
                                              //                           18.0),
                                              //               side: BorderSide(
                                              //                   color: Colors
                                              //                       .black)))),
                                              //   onPressed: () {
                                              //     Navigator.pushReplacement(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const Register(),
                                              //       ),
                                              //     );
                                              //   },
                                              //   child: const Text(
                                              //     "   Register   ",
                                              //     style: TextStyle(
                                              //       fontSize: 20,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Teacher") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Teacher(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Student(),
            ),
          );
        }
      } else {
        if (kDebugMode) {
          print('Document does not exist on the database');
        }
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          if (kDebugMode) {
            print('No user found for that email.');
          }
        } else if (e.code == 'wrong-password') {
          if (kDebugMode) {
            print('Wrong password provided for that user.');
          }
        }
      }
    }
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
      if (emailController.text == "" || passwordController.text == "") {
        _btnController.error();
        Future.delayed(const Duration(milliseconds: 1000), () {
// Here you can write your code

          setState(() {
            _btnController.reset();
          });
        });
      }

      if (emailController.text == 'admin1@gmail.com' &&
          passwordController.text == '123456') {
        _btnController.success();
        Future.delayed(const Duration(milliseconds: 600), () {
// Here you can write your code

          setState(() {
            showMsg('HEllo Admin');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminPage(),
              ),
            );
          });
        });

//         _btnController.error();
//         Future.delayed(const Duration(milliseconds: 600), () {
//
// // Here you can write your code
//
//           setState(() {
//             _btnController.reset();
//           });
//
//         });
      }

      if (emailController.text != 'admin1@gmail.com' ||
          passwordController.text != '123456' ||
          emailController.text != null ||
          passwordController.text != null) {
        signInWithUsernameAndPassword(
          emailController.text,
          passwordController.text,
        );

        Future.delayed(const Duration(milliseconds: 600), () {
// Here you can write your code

          setState(() {
            _btnController.reset();
          });
        });
      }
    });
  }
}
