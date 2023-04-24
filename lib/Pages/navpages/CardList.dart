import 'package:flutter/material.dart';
import 'package:newapp/Pages/navpages/Book_page.dart';

class CardList extends StatelessWidget {

  final List<String> titles = [
    'Home Shifting',
    'Office Relocation',
    'Car Transportation',
    'Bike/Scooter Moving',
    'Few Goods Relocation',
    'Storage Service'
  ];

  final List<String> descriptions = [
    'Door To Door Service Best Quality Packing Affordable Cost Moving Local, Domestic& International Moving',
    '5-star rated office move consultants ecure file relocations and offsite Affordable Cost Moving Technicians Skilled in Moving IT Equipment',
    'Safe and Secure Move Vehicle Insurance Service Available Door to Door Delivery',
    'High Quality Vehicle Packing Best Price Delivery Local, Domestic &International Moving',
    'Door to Door Service Best Quality Packing Affordable Cost Moving Local, Domestic &International Moving',
    'Hiusehold Storge Service Office Storage Service CCTV Secured Storage Local, Domestic & International Warehouse'
  ];
  final List image = [
    'assets/CardListImage/HomeMovers.jpeg',
    'assets/CardListImage/officeMover.jpeg',
    'assets/CardListImage/CarMovers.jpeg',
    'assets/CardListImage/Bike.jpeg',
    'assets/CardListImage/FewGoodsMovers.jpeg',
    'assets/CardListImage/StorageMovers.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image[index],
                    width: 85,
                    height: 85,
                    alignment: FractionalOffset.topCenter,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: Text(
                          titles[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 20, 10),
                        child: Text(
                          descriptions[index],
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Book()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    child: const Text('Book Now'),
                  ),
                ),
              ]),
            ],
          ));
        },
      ),
    );
  }
}
