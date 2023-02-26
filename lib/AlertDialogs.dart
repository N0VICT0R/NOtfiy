import 'package:flutter/material.dart';


import 'login (2).dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
      BuildContext context,
      String title,
      String body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Background color
              ),
              onPressed: () =>
                  Navigator.of(context).pop(DialogsAction.cancel),
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Background color
              ),
              onPressed: () =>
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  LoginPage()),
        ),

              child: Text(
                'Confirm',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      },);
    return (action != null) ? action : DialogsAction.cancel;
  }
}