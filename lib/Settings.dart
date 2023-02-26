import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'AlertDialogs.dart';
import 'Home sccccccccccrrrrrrrren.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyCustomUI()),
                );
              },
              child: Row(
                children: [
                  Text(
                    "FAQ",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                Text(
                  "Terms & Conditions",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 258,
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                setState(()async {

                    final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'are you sure ?');
                    if(action == DialogsAction.yes) {
                      setState(() => tappedYes = true);
                    } else {
                      setState(() => tappedYes = false);
                    }


                });
              },
              child: Row(
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 118,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
