import 'package:flutter/material.dart';

import '../common/CommonText.dart';
import '../utils/AppConst.dart';

class DialogAlert extends StatelessWidget {

  Function onDoneClick;
  String? title;
  String? message;
  String? buttonName;

  DialogAlert({this.title, this.message, this.buttonName, required this.onDoneClick});

  @override
  Widget build(BuildContext context) {
    return
      SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Colors.blueGrey,
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.all(20),
        titlePadding: const EdgeInsets.all(20),
        title: Center(child: CommonText(text: title ?? 'Booking successful!', fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white,),),
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 72,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message ?? 'Your booking is successful. Our team will call you on given mobile number as soon as possible.', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),),
          ),
          ElevatedButton(
              onPressed: () {
                onDoneClick();
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: AppConst.greenColor,
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  elevation: 1),
              child: CommonText(
                text: buttonName ?? 'Okay',
                color: AppConst.whiteColor,
              ))
        ],
      );
  }

}