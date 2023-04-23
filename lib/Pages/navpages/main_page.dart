import 'package:flutter/material.dart';
import 'package:newapp/Pages/navpages/Book_page.dart';
import 'package:newapp/Pages/navpages/Home_Page.dart';
import 'package:newapp/Pages/navpages/Services_page.dart';
import 'package:newapp/Pages/navpages/FAQ_Page.dart';
import 'package:newapp/menu/HomeMenu.dart';
import 'package:url_launcher/url_launcher.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    Book(),
   const ServicesPage(),
    FAQPage(),


  ];
  int currenIndex=0;
  void onTap(int index){
    setState(() {
      currenIndex = index;
    });

  }
  void _mailTo()async {
    String email = 'sagasbaba55@gmail.com';
    var mailUrl = 'mailto:$email';
    if ( await canLaunch(mailUrl)){
      await launch(mailUrl);
    } else {
      print('Error');
      throw 'Error occured';
    }
  }
  void _openWhatsAppChat()async {
    String phoneNumber = '+91 9983707875';
    var Url = 'https://wa.me/$phoneNumber?text=HelloTeam';
    if ( await canLaunch(Url)){
      await launch(Url);
    } else {
      print('Error');
      throw 'Error occured';
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar:
          AppBar(
            backgroundColor: Colors.lightBlue,
            title: const Text('Ready To Move',style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
            centerTitle: true,
            leading: const Padding(
              padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
              child: InkWell(
                child: CircleAvatar(

                  backgroundImage: AssetImage('assets/img/MoveManager.jpg'), // Replace with your logo image path
                ),

              ),
            ),
            actions: <Widget>[
              HomeMenu()
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
            BottomNavigationBarItem(label: 'FAQ',icon: Icon(Icons.question_answer)),
          ]
        ),

      ),
    );


  }




}
