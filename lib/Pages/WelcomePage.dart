import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailButton extends StatelessWidget {
  const MailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        const email = 'mailto:your.email@gmail.com';
        if (await canLaunchUrl(email as Uri)) {
          await launchUrl(email as Uri);
        } else {
          throw 'Could not launch $email';
        }
      },
      child: const Text('Send Email'),
    );
  }
}
