import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

 Completer<GoogleMapController> _controller = Completer(); 

  LatLng location = LatLng(-7.913424045644362, 113.8218964669404);

  CameraPosition _kGooglePlex = CameraPosition(
    zoom: 18,
    target: LatLng(-7.913424045644362, 113.8218964669404),
  );

  Set<Marker> marker = {};

  @override
  void initState() {
    super.initState();
    setState(() {
         marker.add(Marker(markerId: MarkerId("marker ashiap"),position: location)); 
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: marker,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}