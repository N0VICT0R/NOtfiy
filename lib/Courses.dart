import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Table"),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID',style: TextStyle(fontSize: 20),)),
              DataColumn(label: Text('CourseName',style: TextStyle(fontSize: 25),)),


            ],
            rows: [
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('math')),

                ],),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('software engineering 2')),

                ],),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Network programing')),

                ],),
            ],
          ),
        )
    );
  }

}
