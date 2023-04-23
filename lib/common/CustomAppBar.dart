import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(title),
      centerTitle: true,
    );
  }

  CustomAppBar(this.title, {super.key});
}
