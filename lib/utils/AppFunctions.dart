
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/CommonText.dart';
import 'AppConst.dart';

class AppFunctions {

  toast(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message ?? "Something went wrong!"),
    ));
  }

  String makeFirstLetterUppercase(String? str) {
    // Check if the string is not empty
    if(str == null) {
      return '';
    }
    if (str.isNotEmpty) {
      // Use the substring method to get the first character of the string
      // and convert it to uppercase using the toUpperCase method
      var firstLetter = str.substring(0, 1).toUpperCase();

      // Use the substring method to get the rest of the string
      // and append it to the first letter
      return firstLetter + str.substring(1);
    }

    // Return the original string if it is empty
    return str;
  }


  progressBar() {
    return Container(
        margin: const EdgeInsets.all(40),
        child: const CircularProgressIndicator(
          color: AppConst.primaryColor,
        ));
  }

  noDataAvailable({String? msg}) {
    return Container(
        margin: const EdgeInsets.all(40),
        child: CommonText(
          text: msg ?? 'No Result Found',
        ));
  }

  formattedDateTime(int? millis) {
    DateTime now = DateTime.fromMillisecondsSinceEpoch((millis ?? 0));
    DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    String formattedDateTime = formatter.format(now);
    return formattedDateTime;
  }

  formattedDate(int millis) {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(millis);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDateTime = formatter.format(now);
    return formattedDateTime;
  }


}

class ImageDialog extends StatelessWidget {

  Function? onPressed;
  String? buttonName;
  String? message;
  IconData? icon;

  ImageDialog({this.onPressed, this.buttonName, this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Icon(icon ?? Icons.check_circle, color: AppConst.greenColor, size: 50,),
            ),
            const SizedBox(
              height: 10,
            ),
            CommonText(
              text: message ?? 'Bank account saved',
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 40,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: Text(buttonName != null ? buttonName ?? 'Okay' : 'Okay'),
                  onPressed: () {
                    onPressed!();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
