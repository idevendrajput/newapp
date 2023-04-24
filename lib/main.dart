import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newapp/utils/AppConst.dart';
import 'package:url_strategy/url_strategy.dart';
import 'Pages/navpages/main_page.dart';
import 'dart:async';
import 'dart:io' as IO;
import 'api_helper/rest_client.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppConst.appName,
      debugShowCheckedModeBanner: false,

      home: MainPage(),

    );
  }
}

Future<RestClient?> getRestClient() async {

  try {
    String _token = "94zjFolOXZD05iw8D9rHhXa2v6e7vlOIOtE2gEVaVRDMTkdJMdJdSMT7MS9294zjFolOXZD05iwT4RS92";

    Dio _dio = Dio();
    RestClient _client;

    // Print request and response log (Remove comment if need to print api log)
    if(kDebugMode) {
      _dio.interceptors.add(
          LogInterceptor(
              requestHeader: true, requestBody: true));
    }

    // Add header with Dio object
    if (_token.isNotEmpty) {
      final getHeader = {
        "Authorization": "Bearer $_token",
        "Accept": "application/json",
        "ContentType": "application/json",
      };
      _dio.options.headers = getHeader;
    }
    if(!kIsWeb){
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (IO.HttpClient client) {
        client.badCertificateCallback =
            (IO.X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    _client = RestClient(_dio);
    return _client;
  } catch(e) {
    print(e);
    return null;
  }

}



