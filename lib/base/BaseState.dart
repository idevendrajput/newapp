
import 'package:flutter/material.dart';

import '../Loading.dart';
import '../api_helper/network_helper.dart';
import '../api_helper/rest_client.dart';
import '../main.dart';
import '../utils/AppFunctions.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {

  Widget view();
  void init();
  RestClient? client;

  late NetworkHelper networkHelper;

  @override
  void initState() {
    super.initState();
    getRestClient().then((data) {
      client = data;
      networkHelper = NetworkHelper(client!, context);
      init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return view();
  }

  showLoading() {
    Loading.show(context);
  }

  dismissLoading() {
    Loading.hide(context);
  }

  onResponseError({String? msg}) {
    AppFunctions().toast(context, msg ?? "Something went wrong");
  }

  toast(String msg)  {
    AppFunctions().toast(context, msg);
  }

  _showADialog(Widget dialog) {
    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

}
