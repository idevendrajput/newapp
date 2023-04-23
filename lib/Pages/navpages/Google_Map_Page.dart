import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newapp/Pages/navpages/Home_Page.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => GoogleMapState();
}
class GoogleMapState extends State<Map> {
  Set<Marker> _markers = {};
  //    BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  //
  //    void addCustomIcon() {
  //      BitmapDescriptor.fromAssetImage(
  //          const ImageConfiguration(), "assets/img/Map_Marker.png")
  //          .then(
  //          (icon){
  //        setState((){
  //          markerIcon = icon;
  //        });
  //
  //      },
  //      );
  //    }
  @override

  void initState() {
    super.initState();

    // Add some markers
    _markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(26.92, 75.77),
        infoWindow: InfoWindow(title: 'Marker 1'),
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(26.95, 75.74),
        infoWindow: InfoWindow(title: 'Marker 2'),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FIND US BY MAP'),
      ),
      body: Container(
        child: GoogleMap(
          key: ValueKey('AIzaSyCjg18yyl3kYpiNlewvvvP2w2awI9wpaOA'),
          initialCameraPosition: CameraPosition(
            target: LatLng(26.92, 75.77),
            zoom: 10, ),
          onMapCreated: (controller){
            controller.moveCamera(CameraUpdate.newLatLngBounds(LatLngBounds(southwest: LatLng(8.17, 68.75), northeast: LatLng(37.09, 97.40,)), 10.0));
          },
          markers: _markers,
          // markers: {
          //   Marker(
          //     markerId: MarkerId("demo"),
          //     position: LatLng(26.92, 75.77),
          //     draggable: true,
          //     onDragEnd: (value) {
          //
          //     },
          //   ),
          // },


        ),


      ),);
  }
}
