import 'package:flutter/material.dart';

import '../common/CommonText.dart';

class Loading {
  static bool _isShowing = false;

  static void show(BuildContext? context) {
    if (_isShowing) return;
    _isShowing = true;
    if (context == null) return;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => MyProgressDialog(message: 'Please wait...'),
    );
  }

  static void hide(BuildContext? context) {
    if (context == null) return;
    if (!_isShowing) return;
    _isShowing = false;
    Navigator.pop(context);
  }
}

class MyProgressDialog extends StatefulWidget {
  final String message;

  MyProgressDialog({required this.message});

  @override
  _MyProgressDialogState createState() => _MyProgressDialogState();
}

class _MyProgressDialogState extends State<MyProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 45,
                child: CircularProgressIndicator(),
              ),
              SizedBox(width: 15,),
              CommonText(text: widget.message),
            ],
          ),
        )
      ],
    );
  }
}
