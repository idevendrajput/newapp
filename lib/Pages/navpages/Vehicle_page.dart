import 'package:flutter/material.dart';
import 'CardList.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CardList(),
    );
  }
}
