// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notify/tables.dart';
// import 'package:notify5/tables.dart';

// import 'Courses.dart';
// import 'Settings.dart';
// import 'griddashboard.dart';
import 'Courses.dart';
import 'Settings.dart';
import 'griddashboard.dart';
import 'login (2).dart';


class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teacher"),
        leading: const Icon(Icons.menu),
       backgroundColor: Colors.black,
      ),
      body: Container(

        color: Colors.white30,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("assets/fullscreen.jpg"),
        //       fit: BoxFit.cover),
        // ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [


                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  MyApp()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(12, 2, 25, 0.5), //DecorationImage

                                borderRadius: BorderRadius.circular(25),
                              ), //BoxDecoration
                              height: 150,
                              width: 150,
                              // color: Colors.white,
                              child: Center(
                                child: Column(children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //Image.asset
                                  Image.asset(
                                    'assets/calendar2.png',
                                    height: 55,
                                    width: 60,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Calender",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ]),
                              ),
                            ),
                          ),


                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Courses()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:  Color.fromRGBO(12, 2, 25, 0.5),//DecorationImage

                                borderRadius: BorderRadius.circular(25),
                              ), //BoxDecoration
                              height: 150,
                              width: 150,
                              // color: Colors.white,
                              child: Center(
                                child: Column(children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //Image.asset
                                  Image.asset(
                                    'assets/book.png',
                                    height: 55,
                                    width: 60,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Courses",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ]),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),


                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Tables()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:  Color.fromRGBO(12, 2, 25, 0.5), //DecorationImage

                              borderRadius: BorderRadius.circular(25),
                            ), //BoxDecoration
                            height: 150,
                            width: 150,
                            // color: Colors.white,
                            child: Center(
                              child: Column(children: [
                                SizedBox(
                                  height: 15,
                                ),
                                //Image.asset
                                Image.asset(
                                  'assets/cells.png',
                                  height: 55,
                                  width: 60,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Table",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Settings()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(12, 2, 25, 0.5), //DecorationImage
                              borderRadius: BorderRadius.circular(25),
                            ), //BoxDecoration
                            height: 150,
                            width: 150,
                            // color: Colors.white,
                            child: Center(
                              child: Column(children: [
                                SizedBox(
                                  height: 15,
                                ),
                                //Image.asset
                                Image.asset(
                                  'assets/settings0.png',
                                  height: 55,
                                  width: 60,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
