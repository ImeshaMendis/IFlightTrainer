import 'dart:async';

import 'package:flight_training/models/user_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);

    return new Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              
              mapType: MapType.normal,
              circles: Set.from(
                [
                  Circle(
                    strokeWidth: 5,
                    strokeColor: Colors.blueAccent,
                    center:
                        LatLng(userLocation.latitude, userLocation.longitude),
                    radius: 10,
                    circleId: CircleId("1"),
                  )
                ],
              ),
              initialCameraPosition: CameraPosition(
                target: LatLng(userLocation.latitude, userLocation.longitude),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Text("HEIGHT" + userLocation.head.toString()),
          ],
        ),
      ),
    );
  }
}
