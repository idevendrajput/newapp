import 'package:flutter/material.dart';

import 'CommonText.dart';

class IconTextArrow extends StatelessWidget {

  String text = "";
  IconData? icon;
  final Function onPressed;
  IconTextArrow({required this.text, required this.onPressed, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10,0),
    child: GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Row(
        children: [
          Icon(icon ?? Icons.circle),
          const SizedBox(width: 20,),
          CommonText(text: text),
          const Spacer(),
          const IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: null,
            splashColor: Colors.blue,
          )
        ],
      ),
    ),
    );
  }

}

