import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:newapp/Pages/navpages/Google_Map_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newapp/base/BaseState.dart';
import 'package:newapp/model/SliderData.dart';
import 'package:newapp/utils/AppConst.dart';

import '../../utils/Extensions.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {

  List<SliderData> imagesList = [];

  @override
  void init() {
    _getSliders();
  }

  @override
  Widget view() {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                gradient: LinearGradient(colors: [
                  Colors.purple,
                  Colors.blue,
                ], stops: [
                  0.4,
                  1.0,
                ], begin: Alignment.topRight, end: Alignment.bottomRight),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const Text(
                      "BOOK INDIA'S LARGEST MOVERS AT LOWEST PRICE",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Guaranteed On Time and Safe Delivery",
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: const EdgeInsets.all(AppConst.defaultMargin),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 16 / 5,
                            enlargeCenterPage: true,
                          ),
                          items: imagesList.map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 0.01),
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  child: imageFromBase64String(image.image!, BoxFit.fill)
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if(!kIsWeb) InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Map()));
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Find Locations"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(AppConst.defaultMargin),
                      height: 200,
                      width: double.infinity,
                      child: GoogleMap(
                        key:
                        const ValueKey(AppConst.MAP_API),
                        onTap: (l) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Map()));
                        },
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(26.92, 75.77),
                          zoom: 8,
                        ),
                        zoomGesturesEnabled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [
                  Text(
                    "How VRL Movers Team Work?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/img/Requirements_logo.jpg",
                              width: 60,
                              height: 60,
                              alignment: FractionalOffset.topCenter,
                              // matchTextDirection: true,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  child: Text(
                                    "Share Your Requirements",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                                  child: Text(
                                    "Tell us where and when do you want to move",
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                    maxLines: 5, overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/img/Quote_logo.png",
                                  width: 60,
                                  height: 60,
                                  alignment: FractionalOffset.topCenter,
                                  // matchTextDirection: true,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                      child: Text(
                                        "Get Free Instant Quote",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                                      child: Text(
                                        "Get guaranteed lowest priced quote for your shifting.",
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/img/Schedule_logo.png",
                              width: 60,
                              height: 60,
                              alignment: FractionalOffset.topCenter,
                              // matchTextDirection: true,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  child: Text(
                                    "Schedule and Confirm",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 8, 10),
                                  child: Text(
                                    "Pick a slot and confirm your booking free with team",
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/img/Movers_logo.png",
                              width: 60,
                              height: 60,
                              alignment: FractionalOffset.topCenter,
                              // matchTextDirection: true,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  child: Text(
                                    "We get you moved!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 15, 10),
                                  child: Text(
                                    "Our team will arrive as per schedule to pack & load you belonging ",
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: const [
                  Text(
                    "Why VRL Movers and Packers?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/img/BestPrice.jpeg",
                            width: 60,
                            height: 60,
                            alignment: FractionalOffset.topCenter,
                            // matchTextDirection: true,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Text(
                                  "Best Price",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                                child: Text(
                                  "Best Price No surprises on your shifting day, no hidden costs. Saving on the shifting cost by upto 40%  Get exact prices based on shifting details",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/img/Cancellation.png",
                            width: 60,
                            height: 60,
                            alignment: FractionalOffset.topCenter,
                            // matchTextDirection: true,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Text(
                                  "Free Cancellation & Reschedule",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                                child: Text(
                                  " Book your slot today and change the date later anytime. FREE cancelation and full refunds with no questions asked. ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/img/5StarRated.png",
                            width: 60,
                            height: 60,
                            alignment: FractionalOffset.topCenter,
                            // matchTextDirection: true,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Text(
                                  "5 Star Rated Service",
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                                child: Text(
                                  "Selected Top-rated shifting companies out of thousands available in the market. No local vendors, only verified and best-in-class ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/img/MoveManager.jpg",
                            width: 60,
                            height: 60,
                            alignment: FractionalOffset.topCenter,
                            // matchTextDirection: true,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Text(
                                  "Dedicated Move Manager",
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                                child: Text(
                                  "Move manager to make your shifting hassle-free. Move manager makes sure no delays happen on the shifting day.",

                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getSliders() {
    networkHelper.sliders((List<SliderData> value) async {
      setState(() {
        imagesList = value;
      });
    });
  }

}

