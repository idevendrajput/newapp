
import 'package:flutter/material.dart';
import 'package:newapp/base/BaseState.dart';
import 'package:newapp/common/CommonText.dart';

class HelpPageDetails extends StatefulWidget {

  String content = "";
  String title = "";

  HelpPageDetails({required this.content, required this.title, super.key});

  @override
  State<HelpPageDetails> createState() => _HelpPageState();
}

class _HelpPageState extends BaseState<HelpPageDetails> {

  @override
  void init() {

  }

  @override
  Widget view() {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(text: widget.title,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommonText(text: widget.content),
      ),
    );
  }

}
