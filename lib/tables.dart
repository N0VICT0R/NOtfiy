import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


 class Tables extends StatefulWidget {
   const Tables({Key? key}) : super(key: key);

   @override
   State<Tables> createState() => _TablesState();
 }

 class _TablesState extends State<Tables> {
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
             DataColumn(label: Text('CourseName',style: TextStyle(fontSize: 20),)),
             DataColumn(label: Text('Start Date ',style: TextStyle(fontSize: 20),)),
             DataColumn(label: Text('End Date',style: TextStyle(fontSize: 20),)),

           ],
           rows: [
             DataRow(
               cells: <DataCell>[
               DataCell(Text('1')),
               DataCell(Text('math')),
               DataCell(Text('12:05:00')),
               DataCell(Text('14:05:00')),
             ],),
             DataRow(
               cells: <DataCell>[
                 DataCell(Text('2')),
               DataCell(Text('Sw2 ')),
               DataCell(Text('16:05:00')),
               DataCell(Text('18:05:00')),
             ],),
             DataRow(
               cells: <DataCell>[
                 DataCell(Text('3')),
               DataCell(Text('Network programing')),
               DataCell(Text('01:15:00')),
               DataCell(Text('03:15:00')),
             ],),
           ],
         ),
       )
     );
   }

 }
