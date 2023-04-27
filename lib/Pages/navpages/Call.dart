import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallDialog extends StatelessWidget {
  final String number1;
  final String number2;

  const CallDialog({Key? key, required this.number1, required this.number2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Call'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(number1),
            onTap: () async {
              // Launch the phone app with number1
              String phoneNumber = 'tel:$number1';
              if (await canLaunch(phoneNumber)) {
                await launch(phoneNumber);
              } else {
                throw 'Could not launch $phoneNumber';
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(number2),
            onTap: () async {
              // Launch the phone app with number2
              String phoneNumber = 'tel:$number2';
              if (await canLaunch(phoneNumber)) {
                await launch(phoneNumber);
              } else {
                throw 'Could not launch $phoneNumber';
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel',style: TextStyle(color: Colors.grey),

          ),
        ),
      ],
    );
  }
}
