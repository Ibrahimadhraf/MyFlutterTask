import 'package:flutter/material.dart';

class CustomAlertDialog {
  final String message;
  final bool success;
  final BuildContext context;

  CustomAlertDialog({
    this.message,
    this.success,
    @required this.context,
  });

  Future<void> showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: alertView,
    );
  }

  Widget alertView(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      title: Icon(
        success ? Icons.check_box_outline_blank_rounded : Icons.error,
        color: Colors.red,
        size: 60,
      ),
      // title: Image.asset(
      //   'assets/ic_warningpopup.png',
      //   height: 60,
      //   width: 60,
      // ),
      content: new Text(message,  textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('OK!'),
          onPressed: () {
            Navigator.of(context).pop();
            //  Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
