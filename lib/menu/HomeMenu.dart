import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'about':   break;
          case 'contact': break;
          case 'address': break;
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'about',
          child: Text('About Us',style: TextStyle(fontSize: 16,color: Colors.black),),
        ),
        const PopupMenuItem<String>(
          value: 'contact',
          child: Text('Contact Us',style: TextStyle(fontSize: 16,color: Colors.black)),
        ),
        const PopupMenuItem<String>(
          value: 'address',
          child: Text('Address',style: TextStyle(fontSize: 16,color: Colors.black)),
        ),
      ],
    );
  }
}