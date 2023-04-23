import 'package:flutter/cupertino.dart';

import '../api_helper/network_helper.dart';
import '../api_helper/rest_client.dart';
import '../main.dart';

abstract class BaseStateless extends StatelessWidget {

  // Widget view();
  //
  // void init();
  // RestClient? client;
  //
  // late NetworkHelper networkHelper;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getRestClient().then((data) {
  //     client = data;
  //     networkHelper = NetworkHelper(client!, context);
  //     init();
  //   });
  // }
  //
  //
  //
  // showLoading() {
  //   Loading.show(context);
  // }
  //
  // dismissLoading() {
  //   Loading.hide(context);
  // }
  //
  // onResponseError({String? msg}) {
  //   AppFunctions().toast(context, msg ?? "Something went wrong");
  // }
  //
  // toast(String msg)  {
  //   AppFunctions().toast(context, msg);
  // }
  //
  // _showADialog(Widget dialog) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return dialog;
  //       });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return view();
  // }


}