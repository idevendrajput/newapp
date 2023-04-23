import 'package:flutter/material.dart';

class AppConst {

  static const defaultMargin = 16.0;

  static const String MAP_API = "AIzaSyCjg18yyl3kYpiNlewvvvP2w2awI9wpaOA";
  static const String appName = "Ready To Move";
  static const String signIn = "Sign In";
  static const String register = "Register";

  static const String INTERCITY = "Intercity";
  static const String INTRA_CITY = "Intracity";
  static const String INTERNATIONAL = "International";
  static const String COURIER = "Courier";

  static const String AUTH_STATUS = "authStatus";
  static const String AUTH_STATUS_DONE = "authDone";

  static const String PHONE = 'phone';
  static const String EMAIL = 'email';
  static const String PROFILE = 'profile';
  static const String USER_ID = 'userId';
  static const String REFER_CODE = 'referCode';
  static const String BALANCE = 'balance';
  static const String USER_NAME = 'userName';


  static const MaterialAccentColor primaryColor = Colors.blueAccent;
  static const MaterialColor secondaryColor = Colors.lightBlue;

  static const MaterialColor greenColor = Colors.green;
  static const MaterialColor redColor = Colors.red;
  static const MaterialColor violetColor = Colors.deepPurple;
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color bankCardColor = Color(0xff86A0C0);

  static const String BETS = "bets";
  static const String PERIOD_ID = "periodId";
  static const String PERIOD = "period";
  static const String IS_WON = "isWon";
  static const String WINNING_AMOUNT = "winningAmount";
  static const String TIMESTAMP = "timestamp";
  static const String PARITY_TYPE = "parityType";
  static const String PARITY = "parity";
  static const String FAST_PARITY = "fastParity";
  static const String PRICE = "price";
  static const String COLOR = "color";
  static const String NUMBER = "number";
  static const String PREDICTED_COLOR = "predictedColor";
  static const String PREDICTED_NUMBER = "predictedNumber";
  static const String GREEN = "green";
  static const String RED = "red";
  static const String VIOLET = "violet";
  static const String VIOLET_GREEN = "violetGreen";
  static const String VIOLET_RED = "violetRed";
  static const String NULL = "null";

  static const TRANSACTION_STATUS_PENDING = "Pending";
  static const TRANSACTION_STATUS_REJECTED = "Rejected";
  static const TRANSACTION_STATUS_SUCCESS = "Success";
  static const TRANSACTION_STATUS_REFUNDED = "Refunded";
  static const TRANSACTION_STATUS_HOLD = "On Hold";

  static const String BET_ID = "betId";
  static const String SELECTED_NUMBER = "selectedNumber";
  static const String SELECTED_COLOR = "selectedColor";
  static const String CONTRACT_MONEY = "contractMoney";
  static const String CONTRACT_COUNT = "contractCount";
  static const String FEES = "fee";
  static const String DELIVERED_AMOUNT = "deliveredAmount";
  static const String TOTAL_AMOUNT = "totalAmount";

  static const String ONE = "one";
  static const String TWO = "two";
  static const String THREE = "three";
  static const String FOUR = "four";
  static const String FIVE = "five";
  static const String SIX = "six";
  static const String SEVEN = "seven";
  static const String EIGHT = "eight";
  static const String NINE = "nine";
  static const String ZERO = "zero";


}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}