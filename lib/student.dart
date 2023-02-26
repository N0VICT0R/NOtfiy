import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/tables.dart';
// import 'package:notify5/Settings.dart';
// import 'package:notify5/tables.dart';

// import 'Courses.dart';
// import 'griddashboard.dart';
import 'Courses.dart';
import 'Settings.dart';
import 'griddashboard.dart';
import 'login (2).dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

var title = 'Student';

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(title),
        leading: Icon(Icons.menu),
      ),
      body: Container(
       // color: Colors.white30,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(image: NetworkImage("https://www.google.com/search?q=notify&client=ms-android-xiaomi-rev1&prmd=inv&sxsrf=ALiCzsY5cQ5bAaocyY9d7x8Y8wHDtBvkRQ:1672071405350&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjltJ6x15f8AhU4TaQEHfk4Cx8Q_AUoAXoECAIQAQ#imgrc=pqBCtGCoaJjtJM"),fit: BoxFit.cover),
        // ),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("assets/STU.jpeg"),
        //       fit: BoxFit.cover),
        // ),

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(250, 50, 10, 0.5),
                                //DecorationImage

                                borderRadius: BorderRadius.circular(25),
                              ), //BoxDecoration
                              height: 250,
                              width: 180,
                              // color: Colors.white,
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Courses()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    164, 156, 156, 0.50196078),
                                //DecorationImage

                                borderRadius: BorderRadius.circular(25),
                              ), //BoxDecoration
                              height: 150,
                              width: 180,
                              // color: Colors.white,
                              child: Column(

                                  children: [
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
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tables()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(12, 80, 25, 0.5),
                                //DecorationImage

                                borderRadius: BorderRadius.circular(25),
                              ), //BoxDecoration
                              height: 150,
                              width: 180,
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
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settings()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(12, 2, 80, 0.5),
                                //DecorationImage
                                borderRadius: BorderRadius.circular(25),
                              ), //BoxDecoration
                              height: 250,
                              width: 180,
                              // color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

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
