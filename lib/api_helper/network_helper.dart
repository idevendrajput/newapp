import 'package:flutter/material.dart';
import 'package:newapp/api_helper/rest_client.dart';
import 'package:newapp/model/BookingData.dart';

import '../Loading.dart';
import '../utils/AppFunctions.dart';

const String ERROR_OCCURRED = "Error Occurred";

class NetworkHelper {

  RestClient client;
  BuildContext context;

  NetworkHelper(this.client, this.context);

  void newBooking(BookingData request, Function callback) {
    showLoading();
    client.newBooking(request).then((value) async {
      dismissLoading();
      if (validateResponse(value)) {
          callback(true);
      }
    }).onError((error, stackTrace) async {
      dismissLoading();
      onResponseError();
    });
  }

  void sliders(Function callback) {
    showLoading();
    client.sliderList().then((value) async {
      if (validateResponse(value)) {
          callback(value?.data!);
      }
      dismissLoading();
    }).onError((error, stackTrace) async {
      dismissLoading();
      onResponseError();
    });
  }

  void helpPages(Function callback) {
    showLoading();
    client.helpsPage().then((value) async {
      if (validateResponse(value)) {
          callback(value?.data!);
      }
      dismissLoading();
    }).onError((error, stackTrace) async {
      dismissLoading();
      onResponseError();
    });
  }

  bool validateResponse(dynamic value, {bool? dataValidation}) {
    if (value == null) {
      onResponseError(msg: value?.message);
      print("\n\n\n\n\\n\n\No value found\n\n\n\n\n\n\n\n");
      return false;
    } else {
      if (value.status == "Failed") {
        print("\n\n\n\n\\n\n\Failed\n\n\n\n\n\n\n\n");
        onResponseError(msg: value.message);
        return false;
      } else if (dataValidation != false && value.data == null) {
        print("\n\n\n\n\\n\n\nCheck Model Parser\n\n\n\n\n\n\n\n");
        onResponseError(msg: "Data not found");
        return false;
      } else {
        print("<>><><><><>\n\n\n\n Success \n\n\n\n");
        return true;
      }
    }
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

  toast(String msg) {
    AppFunctions().toast(context, msg);
  }
}
