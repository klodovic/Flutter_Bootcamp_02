import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Completer<GoogleMapController> googleMapController = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(45.813043, 15.977388),
    zoom: 6,
  );

  Set<Polygon> polygon = HashSet<Polygon>();
  // created list of locations to display polygon
  List<LatLng> points = [
    const LatLng(46.500388, 16.477540),
    const LatLng(45.785864, 15.362953),
    const LatLng(45.483602, 13.495079),
    const LatLng(43.030230, 16.408963),
    const LatLng(42.606906, 18.228594),
    const LatLng(44.948912, 15.723932),
    const LatLng(45.217153, 16.799760),
    const LatLng(44.877486, 18.985036),
    const LatLng(45.888096, 18.786680),
    const LatLng(45.944231, 17.583097),
    const LatLng(46.407495, 16.712349),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polygon.add(
      Polygon(
        polygonId: const PolygonId('croatia'),
        points: points,
        fillColor: Colors.blue.withOpacity(0.3),
        strokeColor: Colors.blue,
        strokeWidth: 2,
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        // title of app
        title: const Text("Flutter Google Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGoogle,
        mapType: MapType.normal,
        compassEnabled: true,
        polygons: polygon,
        markers: {
          const Marker(
              markerId: MarkerId('Zagreb'),
              position: LatLng(45.813043, 15.977388)
          ),
          const Marker(
              markerId: MarkerId('Bridge'),
              position: LatLng(42.933064, 17.536483)
          )
        },
        onMapCreated: (GoogleMapController controller){
           googleMapController.complete(controller);
           },
      ),
    );
  }
}


