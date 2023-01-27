import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorHandler {

  //error dialogs
  Future errorDialog(BuildContext context, e) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text('Error'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100.00,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Center(
                child: Text(
                  e.message.toString()
                )
              )
              ),
              Container(
                height: 50.0,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
              },
              child: const Text('Ok'),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}