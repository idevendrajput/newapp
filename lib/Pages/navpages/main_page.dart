import 'package:flutter/material.dart';
import 'package:newapp/Pages/navpages/Book_page.dart';
import 'package:newapp/Pages/navpages/Home_Page.dart';
import 'package:newapp/Pages/navpages/Vehicle_page.dart';
import 'package:newapp/Pages/navpages/FAQ_Page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Call.dart';
import 'CourierPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    const HomePage(),
    Book(),
    const VehiclePage(),
    CourierPage(),
    FAQPage(),
  ];

  int currenIndex=0;
  void onTap(int index){
    setState(() {
      currenIndex = index;
    });

  }
  void _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'example@example.com',
    );
    if (await canLaunchUrl(_emailLaunchUri)) {
      await launchUrl(_emailLaunchUri);
    } else {
      throw 'Could not launch $_emailLaunchUri';
    }
  }

  void _launchWhatsApp({required String phone, required String message}) async {
    final Uri _whatsAppLaunchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '$phone/?text=${Uri.encodeFull(message)}',
    );
    if (await canLaunchUrl(_whatsAppLaunchUri)) {
      await launchUrl(_whatsAppLaunchUri);
    } else {
      throw 'Could not launch $_whatsAppLaunchUri';
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:
        AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Ready To Move',style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
            child: InkWell(
              child: CircleAvatar(

                backgroundImage: AssetImage('assets/img/logo.png'), // Replace with your logo image path
              ),

            ),
          ),


          actions: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    _launchWhatsApp(phone: '1234567890', message: 'Hello');
                  },
                  child: Image.asset(
                    'assets/img/whatsapp.png', // Replace with your image asset path
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    _launchEmail();
                  },
                  child:Image.asset(
                    'assets/img/email.png', // Replace with your image asset path
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CallDialog(number1: '+919660991679', number2: '+918059191751');
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/img/call.png', // Replace with your image asset path
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),

            // Row(
            //   children: [
            //     GestureDetector(
            //       onTap: () async {
            //         final Uri _whatsappLaunchUri = Uri(
            //           scheme: 'https',
            //           host: 'wa.me',
            //           path: '/+919660991679', // Replace with your WhatsApp number
            //         );
            //
            //         if (await canLaunch(_whatsappLaunchUri.toString())) {
            //           await launch(_whatsappLaunchUri.toString());
            //         } else {
            //           throw 'Could not launch ${_whatsappLaunchUri.toString()}';
            //         }
            //       },
            //       child: Image.asset(
            //         'assets/img/whatsapp.png', // Replace with your image asset path
            //         width: 25,
            //         height: 25,
            //       ),
            //     ),
            //     const SizedBox(width: 10), // Add some spacing between icons
            //     GestureDetector(
            //       onTap: () async {
            //         final Uri _emailLaunchUri = Uri(
            //           scheme: 'mailto',
            //           path: 'team@readyinmove.com',
            //         );
            //
            //         if (await canLaunch(_emailLaunchUri.toString())) {
            //           await launch(_emailLaunchUri.toString());
            //         } else {
            //           throw 'Could not launch ${_emailLaunchUri.toString()}';
            //         }
            //       },
            //       child: Image.asset(
            //         'assets/img/email.png', // Replace with your image asset path
            //         width: 25,
            //         height: 25,
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //     Padding(
            //       padding: const EdgeInsets.only(right: 7),
            //       child: GestureDetector(
            //         onTap: () {
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return const CallDialog(number1: '+919660991679', number2: '+918059191751');
            //             },
            //           );
            //         },
            //         child: Image.asset(
            //           'assets/img/call.png', // Replace with your image asset path
            //           width: 25,
            //           height: 25,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),


            // IconButton(
            //   icon: const Icon(Icons.call),color: Colors.white,
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return const CallDialog(number1: '+919660991679', number2: '+918059191751');
            //       },
            //     );
            //   },
            //
            // ),
          ],
        ),

        backgroundColor: Colors.white,
        body: pages[currenIndex],
        bottomNavigationBar: BottomNavigationBar(
          // unselectedFontSize: 0,
          // selectedFontSize: 0,
            type:
            BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: onTap,
            currentIndex: currenIndex,
            // selectedItemColor: Colors.black54,
            //   unselectedItemColor: Colors.grey.withOpacity(0.5),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.home_work)),
              BottomNavigationBarItem(label: 'Book',icon: Icon(Icons.quick_contacts_dialer)),
              BottomNavigationBarItem(label: 'Vehicle',icon: Icon(Icons.fire_truck_rounded)),
              BottomNavigationBarItem(label: 'Courier',icon: Icon(Icons.emoji_transportation)),
              BottomNavigationBarItem(label: 'FAQ',icon: Icon(Icons.question_answer)),
            ]
        ),

      ),
    );


  }




}
